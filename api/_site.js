// Shared by the server-rendered post page and the sitemap.
//
// The Supabase URL and anon key are the same public pair that ships in
// /js/config.js — they are not secrets, RLS is what protects the data (see
// supabase/schema.sql). A serverless function has no visitor session, so these
// requests are anonymous: Supabase will only ever return published posts, which
// is exactly what belongs in a crawler's hands.

export const SITE = 'https://doniwirawan.xyz';
export const AUTHOR = 'Doni Wirawan';

const SUPABASE_URL = process.env.SUPABASE_URL || 'https://srzohrmbbxkecagwyzhb.supabase.co';
const SUPABASE_ANON_KEY = process.env.SUPABASE_ANON_KEY ||
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNyem9ocm1iYnhrZWNhZ3d5emhiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODM5Mzk2NjcsImV4cCI6MjA5OTUxNTY2N30.SBYQ4PCgTSR4j69rPteCQGtObmxJY0d1spa1pNssynY';

// A read against the PostgREST endpoint. `query` is everything after the table,
// e.g. "?slug=eq.hello&select=title".
export async function posts(query) {
  const r = await fetch(`${SUPABASE_URL}/rest/v1/posts${query}`, {
    headers: {
      apikey: SUPABASE_ANON_KEY,
      Authorization: `Bearer ${SUPABASE_ANON_KEY}`,
    },
  });
  if (!r.ok) throw new Error(`supabase: ${r.status}`);
  return r.json();
}

export const escapeHtml = (s) =>
  String(s ?? '')
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;');
