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

## Stack

Static HTML and CSS. No build step, no framework, no dependencies. Deployed on Vercel.

```bash
vercel --prod
```

`terms.html` is the combined terms/privacy hub. Where an individual app publishes its own policy,
that one is authoritative — this page summarises and links to it.
