// Contact form endpoint: store the message and email it.
//
// Two independent places for the message to land, and either one is enough. The
// database is the durable copy, the email is the one that reaches an inbox. A
// message is only refused when both fail — losing one is not acceptable, but
// neither is refusing a visitor because the database happens to be paused.
//
// Env (Vercel → Settings → Environment Variables):
//   RESEND_API_KEY   secret; never ships to the browser
//   CONTACT_TO       where to send the notification

const SUPABASE_URL = 'https://srzohrmbbxkecagwyzhb.supabase.co';
// Public by design — the same key the browser already carries. RLS lets anyone
// insert a message and nobody but the admin read one back.
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNyem9ocm1iYnhrZWNhZ3d5emhiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODM5Mzk2NjcsImV4cCI6MjA5OTUxNTY2N30.SBYQ4PCgTSR4j69rPteCQGtObmxJY0d1spa1pNssynY';

const escape = (s) => String(s).replace(/[&<>"']/g, (c) => (
  { '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c]
));

export default async function handler(req, res) {
  if (req.method !== 'POST') return res.status(405).json({ error: 'POST only.' });

  const { name = '', email = '', message = '', website = '' } = req.body || {};

  // Bots fill in every field they find, including the one humans never see.
  if (website) return res.status(200).json({ ok: true });

  const n = String(name).trim(), e = String(email).trim(), m = String(message).trim();
  if (!n || !e || !m) return res.status(400).json({ error: 'Missing a field.' });
  if (n.length > 100 || e.length > 200 || m.length > 5000) {
    return res.status(400).json({ error: 'Too long.' });
  }
  if (!/^[^@\s]+@[^@\s]+\.[^@\s]+$/.test(e)) {
    return res.status(400).json({ error: 'That email address does not look right.' });
  }

  // 1. Store it. Best effort: a paused or unreachable database must not cost a
  // visitor their message when the email below can still deliver it.
  let stored = false;
  try {
    const r = await fetch(SUPABASE_URL + '/rest/v1/messages', {
      method: 'POST',
      headers: {
        apikey: SUPABASE_ANON_KEY,
        Authorization: 'Bearer ' + SUPABASE_ANON_KEY,
        'Content-Type': 'application/json',
        Prefer: 'return=minimal',
      },
      body: JSON.stringify({ name: n, email: e, message: m }),
    });
    stored = r.ok;
    if (!r.ok) console.error('store failed', r.status, await r.text());
  } catch (err) {
    console.error('store threw', err);
  }

  // 2. Email it. Now the only copy if the store above failed.
  const { RESEND_API_KEY, CONTACT_TO } = process.env;
  if (!RESEND_API_KEY || !CONTACT_TO) {
    console.warn('Resend is not configured; no email sent.');
    return stored
      ? res.status(200).json({ ok: true, stored: true, emailed: false })
      : res.status(502).json({ error: 'Could not send your message.' });
  }

  try {
    const r = await fetch('https://api.resend.com/emails', {
      method: 'POST',
      headers: {
        Authorization: 'Bearer ' + RESEND_API_KEY,
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        from: 'doniwirawan.xyz <onboarding@resend.dev>',
        to: [CONTACT_TO],
        reply_to: e,
        subject: `New message from ${n}`,
        html:
          `<p><strong>${escape(n)}</strong> &lt;${escape(e)}&gt; wrote:</p>` +
          `<blockquote style="border-left:3px solid #ddd;padding-left:12px;white-space:pre-wrap">${escape(m)}</blockquote>` +
          `<p style="color:#888;font-size:13px">Reply straight to this email, or read it at ` +
          `<a href="https://doniwirawan.xyz/admin">doniwirawan.xyz/admin</a>.</p>`,
      }),
    });

    if (!r.ok) {
      const detail = await r.text();
      console.error('resend failed', r.status, detail);
      // Nothing kept the message anywhere. Say so, so the visitor can retry.
      return stored
        ? res.status(200).json({ ok: true, stored: true, emailed: false })
        : res.status(502).json({ error: 'Could not send your message.' });
    }
    return res.status(200).json({ ok: true, stored, emailed: true });
  } catch (err) {
    console.error('resend threw', err);
    return stored
      ? res.status(200).json({ ok: true, stored: true, emailed: false })
      : res.status(502).json({ error: 'Could not send your message.' });
  }
}
