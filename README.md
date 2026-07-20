# doniwirawan.xyz

Personal site — a landing page for the web tools I build, plus a combined terms &amp; privacy page
covering all of them.

Live at **https://doniwirawan.xyz**

## The apps

| App | What it is | Live |
|---|---|---|
| **Ascent** | Strava analytics dashboard — stats, charts, heatmap, segments, story cards | [ascent-analytics.doniwirawan.xyz](https://ascent-analytics.doniwirawan.xyz) |
| **Bike Fit Analyzer** | Joint-angle bike fit analysis from a phone video, in the browser | [bikefit.doniwirawan.xyz](https://bikefit.doniwirawan.xyz) |
| **Aksara Bali** | Latin → Balinese script transliterator | [aksarabali.doniwirawan.xyz](https://aksarabali.doniwirawan.xyz) · [Android test](https://play.google.com/apps/testing/xyz.doniwirawan.aksara_bali_mobile) |

## Work

Products and company sites I build and maintain for Studio Five Media Group.

| Project | What it is | Live |
|---|---|---|
| **Studio Five Suite** | Wedding planning dashboard — checklists, contracts, payments, vendors | [suite.studiofiveweddings.com](https://suite.studiofiveweddings.com) |
| **Deliverables Tracker** | Client portal for live photo/video editing progress | [tracker.studiofiveweddings.com](https://tracker.studiofiveweddings.com) |
| **Chapter5** | Wedding website builder — RSVPs, guest lists, galleries, registries | [chapter5.studiofiveweddings.com](https://chapter5.studiofiveweddings.com) |
| **Before The Win Summit** | Event site for a one-day business summit in Singapore | [beforethewinsummit.com](https://www.beforethewinsummit.com/) |

Company sites I build and maintain: [Studio Five Weddings](https://studiofiveweddings.com) ·
[Spaces](https://studiofivespaces.com) · [Corp](https://studiofivecorp.com) ·
[Pixels](https://studiofivepixels.com) · [Straits Bunkering](https://straitsbunkering.com) ·
[Straits Bunkering DMCC](https://straitsbunkering.ae)

## Elsewhere

[LinkedIn](https://www.linkedin.com/in/doniwirawan) ·
[Instagram](https://instagram.com/doni_wirawans) ·
[Twitter](https://twitter.com/doni_wirawans) ·
[Strava](https://www.strava.com/athletes/124436743) ·
[GitHub](https://github.com/doniwirawan) ·
[Ko-fi](https://ko-fi.com/doniwirawan)

## Blog

`/blog` and `/blog/<slug>` render posts from Supabase. `/admin` is a login-gated editor for writing
them. Posts are markdown, rendered client-side.

**Setup (once):**

1. Create a project at [supabase.com](https://supabase.com).
2. SQL editor → paste `supabase/schema.sql` → change the admin email at the bottom → run it.
3. Authentication → Users → **Add user**, with that same email and a password. This is the only
   account that can write posts. Leave signups disabled.
4. Project Settings → API → copy the **Project URL** and the **anon / publishable** key into
   `js/config.js`.
5. Deploy. Log in at `/admin` and write.

The anon key is public by design — it ships to every visitor. The database is protected by Row Level
Security: anyone can read posts where `published = true`, and only the admin email can read drafts or
write anything. **Never put the `service_role` key in `js/config.js`** — it bypasses RLS and would be
readable by anyone viewing source.

## Stack

Static HTML and CSS, no build step. The blog pages pull `@supabase/supabase-js`, `marked` and
`dompurify` from a CDN at runtime. Deployed on Vercel.

```bash
vercel --prod
```

`terms.html` is the combined terms/privacy hub. Where an individual app publishes its own policy,
that one is authoritative — this page summarises and links to it.
