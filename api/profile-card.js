// SVG pieces for the GitHub profile README, in the same style as the Ascent
// stats cards (ascent-analytics.vercel.app/api/card).
//
//   /api/profile-card?part=header&theme=dark|light
//   /api/profile-card?part=chip&id=website|linkedin|instagram|x|kofi|strava
//   /api/profile-card?part=project&id=ascent|bikefit|aksarabali|spmb
//
// An SVG shown as an <img> can't load anything external, so the avatar, app
// logos and brand icons are inlined from data/profile-assets.json (built from
// images/ — re-run that if a logo changes). Brand icons: Simple Icons, CC0.

import { readFileSync } from 'node:fs';

const ASSETS = JSON.parse(readFileSync(new URL('../data/profile-assets.json', import.meta.url), 'utf8'));

const THEMES = {
  dark: { bg: '#131313', border: '#2b2b2b', text: '#f2f2f2', muted: '#8a8a8a', pill: '#1f1f1f' },
  light: { bg: '#ffffff', border: '#e4e4e4', text: '#151515', muted: '#6b6b6b', pill: '#f3f3f3' },
};
const ORANGE = '#FC4C02';
const FONT = `font-family="-apple-system,BlinkMacSystemFont,'Segoe UI',Helvetica,Arial,sans-serif"`;

const esc = (s) => String(s).replace(/[&<>"]/g, (c) => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;' }[c]));

// Rough rendered width of a string at a given size — SVG can't measure text.
function textWidth(s, size) {
  let w = 0;
  for (const ch of s) w += /[il.,:;'|!]/.test(ch) ? 0.28 : /[mwMW@]/.test(ch) ? 0.85 : /[A-Z]/.test(ch) ? 0.66 : /\s/.test(ch) ? 0.3 : 0.56;
  return w * size;
}

const CHIPS = {
  website: { label: 'doniwirawan.xyz', icon: globe },
  linkedin: { label: 'LinkedIn', icon: linkedin },
  instagram: { label: '@doni_wirawans', icon: brand('instagram') },
  x: { label: '@doni_wirawans', icon: brand('x', true) },
  kofi: { label: 'Buy me a coffee', icon: brand('kofi') },
  strava: { label: 'Follow on Strava', icon: brand('strava') },
};

// A Simple Icons glyph (24×24 viewBox) at 18px. `mono` draws it in the text colour —
// X's brand colour is black, which vanishes on the dark theme.
function brand(name, mono) {
  return (x, y, t) => {
    const i = ASSETS.icons[name];
    return `<svg x="${x}" y="${y}" width="18" height="18" viewBox="0 0 24 24"><path d="${i.path}" fill="${mono ? t.text : '#' + i.hex}"/></svg>`;
  };
}
function globe(x, y) {
  return `<g transform="translate(${x + 9} ${y + 9})" fill="none" stroke="${ORANGE}" stroke-width="1.6">`
    + `<circle r="8"/><ellipse rx="3.6" ry="8"/><path d="M-8 0H8M-6.6-4.2H6.6M-6.6 4.2H6.6"/></g>`;
}
function linkedin(x, y) {
  return `<rect x="${x}" y="${y}" width="18" height="18" rx="3.5" fill="#0A66C2"/>`
    + `<text x="${x + 9}" y="${y + 14}" ${FONT} font-size="12.5" font-weight="800" fill="#fff" text-anchor="middle">in</text>`;
}

function chip(id, t) {
  const c = CHIPS[id];
  if (!c) return null;
  const H = 40, W = Math.ceil(16 + 18 + 9 + textWidth(c.label, 13.5) + 18);
  return `<svg xmlns="http://www.w3.org/2000/svg" width="${W}" height="${H}" viewBox="0 0 ${W} ${H}" role="img" aria-label="${esc(c.label)}">
<rect x="0.5" y="0.5" width="${W - 1}" height="${H - 1}" rx="${H / 2 - 0.5}" fill="${t.bg}" stroke="${t.border}"/>
${c.icon(16, 11, t)}
<text x="43" y="25" ${FONT} font-size="13.5" font-weight="600" fill="${t.text}">${esc(c.label)}</text>
</svg>`;
}

function header(t) {
  const W = 830, H = 176;
  return `<svg xmlns="http://www.w3.org/2000/svg" width="${W}" height="${H}" viewBox="0 0 ${W} ${H}" role="img" aria-label="Hi, I'm Doni Wirawan. I build small, free web tools.">
<defs><clipPath id="av"><circle cx="88" cy="88" r="52"/></clipPath>
<linearGradient id="glow" x1="0" x2="1"><stop offset="0" stop-color="${ORANGE}" stop-opacity=".16"/><stop offset=".55" stop-color="${ORANGE}" stop-opacity="0"/></linearGradient></defs>
<rect x="0.5" y="0.5" width="${W - 1}" height="${H - 1}" rx="12" fill="${t.bg}" stroke="${t.border}"/>
<rect x="0.5" y="0.5" width="${W - 1}" height="${H - 1}" rx="12" fill="url(#glow)"/>
<circle cx="88" cy="88" r="56" fill="none" stroke="${ORANGE}" stroke-width="3"/>
<image href="${ASSETS.avatar}" x="36" y="36" width="104" height="104" clip-path="url(#av)"/>
<text x="168" y="68" ${FONT} font-size="28" font-weight="800" fill="${t.text}">Hi, I'm Doni Wirawan <tspan font-weight="400">👋</tspan></text>
<text x="168" y="98" ${FONT} font-size="16" fill="${t.text}">I build small, free web tools — and ride bikes around Bali.</text>
<text x="168" y="126" ${FONT} font-size="13" fill="${t.muted}">Web side of Studio Five Group  ·  Bangkit Academy graduate  ·  Founded GDSC INSTIKI</text>
<text x="168" y="148" ${FONT} font-size="13" font-weight="600" fill="${ORANGE}">doniwirawan.xyz</text>
</svg>`;
}

const PROJECTS = {
  ascent: { name: 'Ascent', tag: 'Strava', desc: ['Strava analytics: charts, a ride heatmap, segment PRs,', 'gear tracking and 9:16 story cards for your rides.'] },
  bikefit: { name: 'Bike Fit Analyzer', tag: 'Cycling', desc: ['Joint angles from a video of you pedalling, graded', 'against bike-fit research. Analysed on your device.'] },
  aksarabali: { name: 'Aksara Bali', tag: 'Culture', desc: ['Latin text to Balinese script in real time, with', 'Sanskrit support. On the web and Android.'] },
  spmb: { name: 'SPMB Bali 2026', tag: 'Data', desc: ['Entry scores at all 88 public high schools in Bali,', 'ranked into tiers so students see where they stand.'] },
};

function project(id, t) {
  const p = PROJECTS[id];
  if (!p) return null;
  const W = 495, H = 120;
  const tagW = Math.ceil(textWidth(p.tag, 11) + 16);
  const nameW = textWidth(p.name, 16) * 1.06; // bold runs a little wider
  return `<svg xmlns="http://www.w3.org/2000/svg" width="${W}" height="${H}" viewBox="0 0 ${W} ${H}" role="img" aria-label="${esc(p.name + ': ' + p.desc.join(' '))}">
<defs><clipPath id="lg"><rect x="22" y="24" width="56" height="56" rx="13"/></clipPath></defs>
<rect x="0.5" y="0.5" width="${W - 1}" height="${H - 1}" rx="10" fill="${t.bg}" stroke="${t.border}"/>
<rect x="22" y="24" width="56" height="56" rx="13" fill="#fff" stroke="${t.border}"/>
<image href="${ASSETS[id]}" x="22" y="24" width="56" height="56" clip-path="url(#lg)"/>
<text x="96" y="42" ${FONT} font-size="16" font-weight="700" fill="${t.text}">${esc(p.name)}</text>
<rect x="${(104 + nameW).toFixed(1)}" y="29" width="${tagW}" height="18" rx="9" fill="${t.pill}" stroke="${t.border}"/>
<text x="${(104 + nameW + tagW / 2).toFixed(1)}" y="42" ${FONT} font-size="11" fill="${t.muted}" text-anchor="middle">${esc(p.tag)}</text>
${p.desc.map((l, i) => `<text x="96" y="${66 + i * 18}" ${FONT} font-size="12.5" fill="${t.muted}">${esc(l)}</text>`).join('\n')}
</svg>`;
}

export default function handler(req, res) {
  const t = THEMES[req.query.theme] || THEMES.dark;
  const { part, id } = req.query;
  const svg = part === 'header' ? header(t) : part === 'chip' ? chip(id, t) : part === 'project' ? project(id, t) : null;
  if (!svg) return res.status(404).json({ error: 'unknown part or id' });
  // Static apart from deploys, which clear the edge cache; a day in GitHub's proxy.
  res.setHeader('Cache-Control', 'public, max-age=86400, s-maxage=86400');
  res.setHeader('Content-Type', 'image/svg+xml; charset=utf-8');
  return res.status(200).send(svg);
}
