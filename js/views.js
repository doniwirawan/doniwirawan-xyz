// Records one page view, so the admin page can show them alongside the posts.
//
// A plain fetch rather than supabase-js: this runs on every page and there is
// no reason to pull a client library in for a single RPC call. Failure is
// silent by design — analytics must never break the page it is measuring.
(function () {
  if (!window.SUPABASE_URL || !window.SUPABASE_ANON_KEY) return;

  var path = location.pathname.replace(/\/+$/, '') || '/';
  if (path.indexOf('/admin') === 0) return;

  // Posts live at /blog/<slug>; everything else has no slug of its own.
  var match = path.match(/^\/blog\/(.+)$/);

  // Only where the visitor came from, never the full referring URL.
  var referrer = '';
  try {
    if (document.referrer) {
      var from = new URL(document.referrer);
      if (from.host !== location.host) referrer = from.host;
    }
  } catch (e) { /* malformed referrer */ }

  fetch(window.SUPABASE_URL + '/rest/v1/rpc/record_view', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      apikey: window.SUPABASE_ANON_KEY,
      Authorization: 'Bearer ' + window.SUPABASE_ANON_KEY,
    },
    body: JSON.stringify({
      p_path: path,
      p_slug: match ? match[1] : null,
      p_referrer: referrer || null,
    }),
    keepalive: true,
  }).catch(function () { /* never surface this */ });
})();
