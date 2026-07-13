// Supabase project credentials.
//
// Both values are public by design: they ship to every visitor's browser. The
// database is protected by Row Level Security (see supabase/schema.sql), not by
// keeping these secret. Never put the service_role key here — it bypasses RLS.
//
// Find these in Supabase → Project Settings → API.
window.SUPABASE_URL = 'https://YOUR-PROJECT.supabase.co';
window.SUPABASE_ANON_KEY = 'YOUR-ANON-KEY';
