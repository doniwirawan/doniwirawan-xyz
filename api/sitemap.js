// sitemap.xml
//
// The blog index builds its list in the browser, so a crawler that does not run
// JavaScript has no links to follow and would never find a post. This gives it
// the full list, generated from the same published rows the public can read.

import { SITE, posts } from './_site.js';

const PAGES = [
  { path: '/', priority: '1.0', changefreq: 'weekly' },
  { path: '/blog', priority: '0.8', changefreq: 'weekly' },
  { path: '/terms', priority: '0.3', changefreq: 'yearly' },
  { path: '/privacy', priority: '0.3', changefreq: 'yearly' },
];

const url = ({ loc, lastmod, changefreq, priority }) =>
  `  <url>
    <loc>${loc}</loc>${lastmod ? `\n    <lastmod>${lastmod}</lastmod>` : ''}
    <changefreq>${changefreq}</changefreq>
    <priority>${priority}</priority>
  </url>`;

export default async function handler(req, res) {
  let entries = PAGES.map((p) => url({ loc: SITE + p.path, ...p }));

  try {
    const rows = await posts(
      '?published=is.true&select=slug,published_at,updated_at&order=published_at.desc'
    );
    entries = entries.concat(rows.map((p) => url({
      loc: `${SITE}/blog/${encodeURIComponent(p.slug)}`,
      lastmod: (p.updated_at || p.published_at || '').slice(0, 10) || undefined,
      changefreq: 'monthly',
      priority: '0.7',
    })));
  } catch (err) {
    // A sitemap of just the static pages beats a 500: the crawler keeps the
    // pages it can still reach, and tries again later.
    console.error(err);
    res.setHeader('Cache-Control', 'no-store');
  }

  res.setHeader('Content-Type', 'application/xml; charset=utf-8');
  if (!res.getHeader('Cache-Control')) {
    res.setHeader('Cache-Control', 's-maxage=3600, stale-while-revalidate=86400');
  }
  return res.status(200).send(
    `<?xml version="1.0" encoding="UTF-8"?>\n` +
    `<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n${entries.join('\n')}\n</urlset>\n`
  );
}
