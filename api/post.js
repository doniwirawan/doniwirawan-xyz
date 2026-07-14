// Server-rendered blog post.
//
// /blog/:slug used to be an empty shell that fetched the post in the browser.
// Google can usually cope with that; the AI crawlers (GPTBot, ClaudeBot,
// PerplexityBot, CCBot) and link-preview scrapers cannot — none of them run
// JavaScript, so every post looked blank to them. This function fetches the post
// server-side and ships real HTML: title, description, Open Graph, JSON-LD, and
// the article text itself.
//
// It only ever sees published posts (anonymous request, RLS decides). For a draft
// — or if Supabase is unreachable — it falls back to the browser-rendered shell,
// which is what the site did before, and which can use the admin's own session.

import { marked } from 'marked';
import { SITE, AUTHOR, posts, escapeHtml } from './_site.js';

const chrome = {
  head: `<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-N3FBDCFQ');</script>
<!-- End Google Tag Manager -->
<link rel="icon" href="/images/icon.png">
<link rel="apple-touch-icon" href="/images/icon.png">
<link rel="stylesheet" href="/style.css">`,

  nav: `<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-N3FBDCFQ"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->

<nav class="nav">
  <div class="nav-inner">
    <a class="nav-name" href="/">
      <img class="nav-avatar" src="/images/avatar.png" alt="" width="26" height="26">
      Doni Wirawan
    </a>
    <button class="nav-toggle" type="button" aria-label="Menu" aria-expanded="false" aria-controls="nav-links">
      <svg class="open" viewBox="0 0 24 24" aria-hidden="true"><path d="M4 7h16M4 12h16M4 17h16"/></svg>
      <svg class="close" viewBox="0 0 24 24" aria-hidden="true"><path d="M6 6l12 12M18 6L6 18"/></svg>
    </button>
    <div class="nav-links" id="nav-links">
      <a href="/#projects">Projects</a>
      <a href="/#about">About</a>
      <a href="/blog">Blog</a>
      <a href="/#cycling">Cycling</a>
      <a href="/#connect">Connect</a>
    </div>
  </div>
</nav>`,

  footer: `<footer class="wrap footer">
  <div>© <span id="yr">2026</span> Doni Wirawan</div>
  <div class="footer-links">
    <a href="/">Home</a>
    <a href="/blog">Blog</a>
    <a href="/terms">Terms</a>
    <a href="/privacy">Privacy</a>
    <a href="https://github.com/doniwirawan" target="_blank" rel="noopener">GitHub</a>
    <a href="https://www.linkedin.com/in/doniwirawan/" target="_blank" rel="noopener">LinkedIn</a>
    <a href="https://ko-fi.com/doniwirawan" target="_blank" rel="noopener">Ko-fi</a>
  </div>
</footer>

<script>document.getElementById('yr').textContent = new Date().getFullYear();</script>
<script defer src="/_vercel/insights/script.js"></script>
<script src="/js/nav.js"></script>`,
};

const page = ({ title, head = '', body }) => `<!DOCTYPE html>
<html lang="en">
<head>
${chrome.head}
<title>${escapeHtml(title)}</title>
${head}
</head>
<body>
${chrome.nav}

<main class="wrap doc">
${body}
  <p style="margin-top:36px;"><a href="/blog">← All posts</a></p>
</main>

${chrome.footer}
</body>
</html>`;

// What the site did before this function existed: render in the browser. Drafts
// need it (the server cannot see them), and it keeps the page working if Supabase
// is down. Nothing here is worth indexing, so it says so.
const shell = () => page({
  title: 'Blog — Doni Wirawan',
  head: `<meta name="robots" content="noindex">`,
  body: `  <article id="post"><p class="prose">Loading…</p></article>`,
}).replace('</body>', `<script src="/js/config.js"></script>
<script type="module" src="/js/post.js"></script>
</body>`);

const fmt = (d) => new Date(d).toLocaleDateString('en-GB', {
  day: 'numeric', month: 'long', year: 'numeric',
});

function render(post, slug) {
  const url = `${SITE}/blog/${slug}`;
  const title = `${post.title} — ${AUTHOR}`;
  const cover = post.cover_url || '';

  // Mirrors the browser renderer: when the cover was lifted from the body's first
  // image, showing it as a hero as well would print the same picture twice.
  const bodyFirstImage = (() => {
    const md = (post.body || '').match(/!\[[^\]]*\]\(([^)\s]+)/);
    if (md) return md[1];
    const html = (post.body || '').match(/<img[^>]+src=["']([^"']+)["']/i);
    return html ? html[1] : null;
  })();
  const heroIsDuplicate = cover && bodyFirstImage &&
    cover.split('?')[0] === bodyFirstImage.split('?')[0];

  // The body is written by the site owner alone (RLS lets nobody else near it),
  // so this is the author's own markdown — rendered, not sanitised, the same way
  // any static site generator treats its source.
  const article = marked.parse(post.body || '');

  const ld = {
    '@context': 'https://schema.org',
    '@type': 'BlogPosting',
    headline: post.title,
    description: post.excerpt || undefined,
    image: cover || undefined,
    datePublished: post.published_at || undefined,
    dateModified: post.updated_at || post.published_at || undefined,
    author: { '@type': 'Person', name: AUTHOR, url: SITE },
    publisher: { '@type': 'Person', name: AUTHOR, url: SITE },
    mainEntityOfPage: { '@type': 'WebPage', '@id': url },
  };

  const head = [
    post.excerpt ? `<meta name="description" content="${escapeHtml(post.excerpt)}">` : '',
    // A post that ran somewhere else first should credit that copy as the original.
    `<link rel="canonical" href="${escapeHtml(post.canonical_url || url)}">`,
    `<meta property="og:type" content="article">`,
    `<meta property="og:title" content="${escapeHtml(post.title)}">`,
    post.excerpt ? `<meta property="og:description" content="${escapeHtml(post.excerpt)}">` : '',
    `<meta property="og:url" content="${escapeHtml(url)}">`,
    cover ? `<meta property="og:image" content="${escapeHtml(cover)}">` : '',
    post.published_at ? `<meta property="article:published_time" content="${escapeHtml(post.published_at)}">` : '',
    `<meta name="twitter:card" content="${cover ? 'summary_large_image' : 'summary'}">`,
    `<meta name="twitter:title" content="${escapeHtml(post.title)}">`,
    post.excerpt ? `<meta name="twitter:description" content="${escapeHtml(post.excerpt)}">` : '',
    cover ? `<meta name="twitter:image" content="${escapeHtml(cover)}">` : '',
    `<script type="application/ld+json">${JSON.stringify(ld)}</script>`,
  ].filter(Boolean).join('\n');

  const origin = post.canonical_url
    ? `<p class="post-origin">Originally published on ${escapeHtml(post.source || 'another site')}. <a href="${escapeHtml(post.canonical_url)}" target="_blank" rel="noopener">Read it there</a>.</p>`
    : '';

  const body = `  <article id="post">
    <h1>${escapeHtml(post.title)}</h1>
    <p class="meta">${post.published_at ? escapeHtml(fmt(post.published_at)) : ''}</p>
    ${cover && !heroIsDuplicate ? `<img class="post-hero" src="${escapeHtml(cover)}" alt="">` : ''}
    <div class="post-body">${article}</div>
    ${origin}
  </article>`;

  return page({ title, head, body });
}

export default async function handler(req, res) {
  const slug = String(req.query?.slug || '').replace(/\/$/, '');
  res.setHeader('Content-Type', 'text/html; charset=utf-8');

  if (!slug) {
    res.setHeader('Location', '/blog');
    return res.status(302).end();
  }

  try {
    const rows = await posts(
      `?slug=eq.${encodeURIComponent(slug)}&published=is.true` +
      `&select=title,excerpt,body,published_at,updated_at,canonical_url,source,cover_url&limit=1`
    );

    // No published post at this address. It may still be a draft the owner is
    // previewing, so hand over to the browser, which has their session.
    if (!rows.length) {
      res.setHeader('Cache-Control', 'no-store');
      return res.status(200).send(shell());
    }

    res.setHeader('Cache-Control', 's-maxage=300, stale-while-revalidate=86400');
    return res.status(200).send(render(rows[0], slug));
  } catch (err) {
    // Supabase is unreachable. Degrade to what the site did before: let the
    // browser try. Never cache a failure.
    console.error(err);
    res.setHeader('Cache-Control', 'no-store');
    return res.status(200).send(shell());
  }
}
