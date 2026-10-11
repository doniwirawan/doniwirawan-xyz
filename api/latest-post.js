// The newest blog post, for places that can only hold a fixed link or image —
// e.g. the GitHub profile README.
//
//   /blog/latest                          → 302 to the newest post
//   /api/latest-post?card=1&theme=dark    → SVG card of it (theme=light too)
//
// Both read data/posts.json, so they update on the next deploy after a post ships.

import { SITE, allPosts } from './_site.js';

const THEMES = {
  dark: { bg: '#131313', border: '#2b2b2b', text: '#f2f2f2', muted: '#8a8a8a' },
  light: { bg: '#ffffff', border: '#e4e4e4', text: '#151515', muted: '#6b6b6b' },
};
const ORANGE = '#FC4C02';

const esc = (s) => String(s).replace(/[&<>"]/g, (c) => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;' }[c]));

// SVG has no text wrapping, so break on words by an approximate characters-per-line.
function wrap(text, perLine, maxLines) {
  const lines = [''];
  for (const word of String(text).split(/\s+/)) {
    const cur = lines[lines.length - 1];
    if (!cur || (cur + ' ' + word).length <= perLine) lines[lines.length - 1] = cur ? cur + ' ' + word : word;
    else if (lines.length < maxLines) lines.push(word);
    else { lines[lines.length - 1] = cur.replace(/[\s,.;:]*$/, '') + '…'; break; }
  }
  return lines;
}

function card(p, t) {
  const W = 830;
  const lang = p.lang === 'id' ? 'Bahasa Indonesia' : 'English';
  const date = new Date(p.published_at).toLocaleDateString('en-US', { day: 'numeric', month: 'short', year: 'numeric', timeZone: 'Asia/Makassar' });
  const mins = Math.max(1, Math.round(String(p.body || '').split(/\s+/).length / 200));
  const title = wrap(p.title, 62, 2);
  const excerpt = wrap(p.excerpt || '', 125, 2);
  const yEx = 84 + (title.length - 1) * 26 + 30;
  const H = yEx + excerpt.length * 19 + 34;
  return `<svg xmlns="http://www.w3.org/2000/svg" width="${W}" height="${H}" viewBox="0 0 ${W} ${H}" role="img" aria-label="${esc('Latest blog post: ' + p.title)}">
<style>text{font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Helvetica,Arial,sans-serif}</style>
<rect x="0.5" y="0.5" width="${W - 1}" height="${H - 1}" rx="10" fill="${t.bg}" stroke="${t.border}"/>
<rect x="25" y="22" width="4" height="16" rx="1" fill="${ORANGE}"/>
<text x="36" y="35" font-size="15" font-weight="700" fill="${t.text}">Latest from the blog</text>
<text x="${W - 25}" y="35" font-size="12" fill="${t.muted}" text-anchor="end">${esc(`${date} · ${mins} min read · ${lang}`)}</text>
${title.map((l, i) => `<text x="25" y="${84 + i * 26}" font-size="21" font-weight="700" fill="${t.text}">${esc(l)}</text>`).join('\n')}
${excerpt.map((l, i) => `<text x="25" y="${yEx + i * 19}" font-size="13" fill="${t.muted}">${esc(l)}</text>`).join('\n')}
<text x="25" y="${H - 20}" font-size="12" font-weight="600" fill="${ORANGE}">Read it on doniwirawan.xyz →</text>
</svg>`;
}

export default function handler(req, res) {
  const p = allPosts()[0];
  if (!p) return res.status(404).end();
  // An hour at the edge (a new post is a new deploy, which clears it anyway); the
  // card also gets an hour in GitHub's image proxy, the redirect none in browsers.
  if (req.query.card) {
    res.setHeader('Cache-Control', 'public, max-age=3600, s-maxage=3600, stale-while-revalidate=86400');
    res.setHeader('Content-Type', 'image/svg+xml; charset=utf-8');
    return res.status(200).send(card(p, THEMES[req.query.theme] || THEMES.dark));
  }
  res.setHeader('Cache-Control', 'public, max-age=0, s-maxage=3600');
  res.setHeader('Location', `${SITE}/blog/${encodeURIComponent(p.slug)}`);
  return res.status(302).end();
}
