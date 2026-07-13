// Returns aggregate Strava totals for the homepage.
//
// The refresh token and client secret live in Vercel environment variables and
// never reach the browser. Only the numbers below are returned — no GPS, no
// activity list, no start points. Public mileage is fine; a map of where I live
// is not.
//
// Required env vars (Vercel → Settings → Environment Variables):
//   STRAVA_CLIENT_ID
//   STRAVA_CLIENT_SECRET
//   STRAVA_REFRESH_TOKEN
//   STRAVA_ATHLETE_ID   (optional — looked up from the token if absent)

const EVEREST_M = 8849;

export default async function handler(req, res) {
  const { STRAVA_CLIENT_ID, STRAVA_CLIENT_SECRET, STRAVA_REFRESH_TOKEN, STRAVA_ATHLETE_ID } = process.env;

  if (!STRAVA_CLIENT_ID || !STRAVA_CLIENT_SECRET || !STRAVA_REFRESH_TOKEN) {
    return res.status(503).json({ error: 'Strava is not configured.' });
  }

  try {
    const auth = await fetch('https://www.strava.com/oauth/token', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        client_id: STRAVA_CLIENT_ID,
        client_secret: STRAVA_CLIENT_SECRET,
        refresh_token: STRAVA_REFRESH_TOKEN,
        grant_type: 'refresh_token',
      }),
    });

    if (!auth.ok) {
      const detail = await auth.text();
      throw new Error(`token refresh failed (${auth.status}): ${detail.slice(0, 300)}`);
    }
    const { access_token, athlete } = await auth.json();
    const headers = { Authorization: `Bearer ${access_token}` };

    // The token knows who it belongs to, so the athlete ID is optional config.
    let athleteId = STRAVA_ATHLETE_ID || athlete?.id;
    if (!athleteId) {
      const me = await fetch('https://www.strava.com/api/v3/athlete', { headers });
      if (!me.ok) throw new Error('athlete lookup failed: ' + me.status);
      athleteId = (await me.json()).id;
    }

    const r = await fetch(
      `https://www.strava.com/api/v3/athletes/${athleteId}/stats`,
      { headers }
    );
    if (!r.ok) throw new Error('stats failed: ' + r.status);

    const s = await r.json();
    const all = s.all_ride_totals || {};
    const ytd = s.ytd_ride_totals || {};
    const elevation = Math.round(all.elevation_gain || 0);

    // Cache at the edge: Strava's numbers move slowly and their rate limit does not.
    res.setHeader('Cache-Control', 's-maxage=3600, stale-while-revalidate=86400');

    return res.status(200).json({
      rides: all.count || 0,
      km: Math.round((all.distance || 0) / 1000),
      hours: Math.round((all.moving_time || 0) / 3600),
      elevation,
      everests: +(elevation / EVEREST_M).toFixed(1),
      ytdKm: Math.round((ytd.distance || 0) / 1000),
      longestRideKm: Math.round((s.biggest_ride_distance || 0) / 1000),
      biggestClimbM: Math.round(s.biggest_climb_elevation_gain || 0),
    });
  } catch (err) {
    console.error(err);
    // The message carries Strava's own status and error text — never credentials.
    return res.status(502).json({ error: 'Could not reach Strava.', detail: String(err.message) });
  }
}
