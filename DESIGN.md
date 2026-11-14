# Design: Dawn Ride

Direction for doniwirawan.xyz, set 2026-11-14. Lead skill: build-awwwards-quality-sites.
Support: antislop (during), awesome-design (Nike tokens), dataviz, web-quality/SEO audit.

**Design Read:** personal hub for people who want to know Doni (builder and rider in Bali),
in a Dawn Ride editorial-athletic language with Nike-derived type and controls.
**Dial: ENERGY 3 / RHYTHM 3 / MOTION 3.**

## Visual thesis
The home page reads like one ride, from before sunrise to dusk. Each section is a leg with a
clock time (05:30 hero → 06:15 writing → 07:00 apps → 08:30 work → 10:00 cycling → 12:30
reading → 15:00 about → 17:45 connect → dusk footer). The page background is one gradient over
the whole document, so scrolling literally moves through the day. A route line with waypoint
dots runs down the left rail and draws itself as you scroll (identity motif).

## Hero focal asset
`images/portrait-cutout.webp`: the transparent cutout (mask from `portrait-nobg.png`, upscaled
onto the 4365px `S5 Formal-3.jpg`), standing in front of the giant name and a rising sun disc.
Name also set in Aksara Bali (`ᬤᭀᬦᬶ​ᬯᬶᬭᬯᬦ᭄`, output of Doni's own converter).

## Type
- **Archivo** (variable, wdth 62–125). Display: wdth 62, wght 800, uppercase, line-height .84.
  Reason: Nike's condensed campaign lockups, read as event signage for a rider.
  Text: wdth 100, 400/600.
- **Newsreader** italic for the one-line statements and blog body. Reason: the editorial half
  of Dawn Ride; long-form reading wants a serif.
- **Noto Sans Balinese**, subset to the name only.
- Small uppercase waypoint labels (tracking .08em) exist only as ride-log timestamps.

## Colour
One gradient of "sky" stops per theme, ink + soft + mute text, one accent (the sun).
- Dark: sky #090b16 → #0e1124 → #17152a → #1f1626 → #26171a → #1d130f; ink #f3efe9; mute #a59f98; sun #ff6a2b.
- Light: sky #dfe3ef → #e9e9f0 → #f3efef → #f8f1e8 → #fbf6ee → #f6e8d8; ink #121212; mute #5e5852; sun #b8380a.
- Footer is always ink-black (dusk). Accent appears on: sun disc, waypoint dots, focus ring,
  link underlines. Never on numbers (dataviz: text wears text tokens).

## Shape (Nike tokens)
Radii: 0 for media and cards, 14px for inputs, full pill for buttons and icon buttons.
Buttons 48px tall. No shadows except the sun's glow (the one glow). Nav is the one blurred surface.

## Motion
GSAP 3.13 + ScrollTrigger, Lenis 1.3.4 as the only smooth-scroll engine (vendored in
`js/vendor/`). Hero intro: sun rises, name lines unmask, portrait settles, aksara wipes in.
Nav, statement and CTAs are never hidden. Section titles reveal word by word. Route line and
photo parallax are scrubbed. Under `prefers-reduced-motion` nothing animates and Lenis is off.
No Three.js: Ascent's public API has aggregates only, so a 3D scene would be decoration.

## Asset provenance
All photos and logos are Doni's own (already in `images/`). Screenshots are of Doni's apps.
Apps without a screenshot (Bike Fit, SPMB) show their logo on a plate, not a fake UI.
Live numbers: Ascent public stats API, Goodreads via `/api/reading`, posts from `data/`.
