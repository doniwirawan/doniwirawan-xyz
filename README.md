# doniwirawan.xyz

Personal site — a landing page for the web tools I build, plus a combined terms &amp; privacy page
covering all of them.

Live at **https://doniwirawan.xyz**

## The apps

| App | What it is | Live |
|---|---|---|
| **Ascent** | Strava analytics dashboard — stats, charts, heatmap, segments, story cards | [ascent-analytics.doniwirawan.xyz](https://ascent-analytics.doniwirawan.xyz) |
| **Bike Fit Analyzer** | Joint-angle bike fit analysis from a phone video, in the browser | [bikefit.doniwirawan.xyz](https://bikefit.doniwirawan.xyz) |
| **Aksara Bali** | Latin → Balinese script transliterator | [aksarabali.doniwirawan.xyz](https://aksarabali.doniwirawan.xyz) |

## Work

Sites and internal tools built for Studio Five Media Group.

| Project | What it is | Live |
|---|---|---|
| **Studio Five Suite** | Wedding planning dashboard — checklists, contracts, payments, vendors | [suite.studiofiveweddings.com](https://suite.studiofiveweddings.com) |
| **Deliverables Tracker** | Client portal for live photo/video editing progress | [tracker.studiofiveweddings.com](https://tracker.studiofiveweddings.com) |
| **Chapter5** | Wedding website builder — RSVPs, guest lists, galleries, registries | [chapter5.studiofiveweddings.com](https://chapter5.studiofiveweddings.com) |
| **Before The Win Summit** | Event site for a one-day business summit in Singapore | [beforethewinsummit.com](https://www.beforethewinsummit.com/) |

## Elsewhere

[LinkedIn](https://www.linkedin.com/in/doniwirawan) ·
[Instagram](https://instagram.com/doni_wirawans) ·
[Twitter](https://twitter.com/doni_wirawans) ·
[Strava](https://www.strava.com/athletes/124436743) ·
[GitHub](https://github.com/doniwirawan) ·
[Ko-fi](https://ko-fi.com/doniwirawan)

## Stack

Static HTML and CSS. No build step, no framework, no dependencies. Deployed on Vercel.

```bash
vercel --prod
```

`terms.html` is the combined terms/privacy hub. Where an individual app publishes its own policy,
that one is authoritative — this page summarises and links to it.
