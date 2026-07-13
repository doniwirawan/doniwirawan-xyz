// Contact form endpoint: store the message, then email it.
//
// Storing comes first on purpose. If Resend is down or out of quota, the message
// is still in the inbox at /admin — a missed notification is annoying, a lost
// message is not acceptable.
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

  // 1. Store it. This is the part that must not fail silently.
  const stored = await fetch(SUPABASE_URL + '/rest/v1/messages', {
    method: 'POST',
    headers: {
      apikey: SUPABASE_ANON_KEY,
      Authorization: 'Bearer ' + SUPABASE_ANON_KEY,
      'Content-Type': 'application/json',
      Prefer: 'return=minimal',
    },
    body: JSON.stringify({ name: n, email: e, message: m }),
  });

  if (!stored.ok) {
    const detail = await stored.text();
    console.error('store failed', stored.status, detail);
    return res.status(502).json({ error: 'Could not save your message.' });
  }

  // 2. Notify. Best effort — the message is already safe.
  const { RESEND_API_KEY, CONTACT_TO } = process.env;
  if (!RESEND_API_KEY || !CONTACT_TO) {
    console.warn('Resend is not configured; message stored but not emailed.');
    return res.status(200).json({ ok: true, emailed: false });
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
      return res.status(200).json({ ok: true, emailed: false });
    }
    return res.status(200).json({ ok: true, emailed: true });
  } catch (err) {
    console.error('resend threw', err);
    return res.status(200).json({ ok: true, emailed: false });
  }
}
