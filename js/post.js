// Client-side post renderer.
//
// Posts are server-rendered by /api/post, so this file does not run for them. It
// is the fallback for when that function could not read the posts file. Same
// rendering, done in the browser against the same data/posts.json.

import { marked } from 'https://esm.sh/marked@12';
import DOMPurify from 'https://esm.sh/dompurify@3';

const article = document.getElementById('post');
const slug = decodeURIComponent(location.pathname.replace(/^\/blog\/?/, '').replace(/\/$/, ''));

const fmt = (d) => new Date(d).toLocaleDateString('en-GB', {
  day: 'numeric', month: 'long', year: 'numeric'
});

if (!slug) {
  location.replace('/blog');
} else {
  // data/posts.json holds published posts only, so anything not in it is a 404.
  let data = null;
  let error = null;
  try {
    const r = await fetch('/data/posts.json');
    if (!r.ok) throw new Error(`posts: ${r.status}`);
    data = (await r.json()).find((p) => p.slug === slug) || null;
  } catch (err) {
    error = err;
  }

  if (error) {
    article.innerHTML = '<p class="prose">Could not load this post right now.</p>';
    console.error(error);
  } else if (!data) {
    article.innerHTML = '<h1>Not found</h1><p class="prose">There is no published post at this address.</p>';
  } else {
    document.title = data.title + ' — Doni Wirawan';
    if (data.excerpt) {
      const meta = document.createElement('meta');
      meta.name = 'description';
      meta.content = data.excerpt;
      document.head.append(meta);
    }
    // Point search engines at the original when the post was first published elsewhere.
    if (data.canonical_url) {
      const canon = document.createElement('link');
      canon.rel = 'canonical';
      canon.href = data.canonical_url;
      document.head.append(canon);
    }

    const h1 = document.createElement('h1');
    h1.textContent = data.title;

    const date = document.createElement('p');
    date.className = 'meta';
    date.textContent = data.published_at ? fmt(data.published_at) : '';

    const body = document.createElement('div');
    body.className = 'post-body';
    body.innerHTML = DOMPurify.sanitize(marked.parse(data.body || ''));

    const parts = [h1, date];

    // When the cover was taken from the body's first image (imported posts, mostly),
    // showing it as a hero as well would print the same picture twice.
    const bodyFirstImage = (() => {
      const md = (data.body || '').match(/!\[[^\]]*\]\(([^)\s]+)/);
      if (md) return md[1];
      const html = (data.body || '').match(/<img[^>]+src=["']([^"']+)["']/i);
      return html ? html[1] : null;
    })();
    const heroIsDuplicate = data.cover_url && bodyFirstImage &&
      data.cover_url.split('?')[0] === bodyFirstImage.split('?')[0];

    if (data.cover_url && !heroIsDuplicate) {
      const hero = document.createElement('img');
      hero.className = 'post-hero';
      hero.src = data.cover_url;
      hero.alt = '';
      // A dead cover should not leave a broken-image icon in the middle of the post.
      hero.onerror = () => hero.remove();
      parts.push(hero);
    }

    // Link previews still want the cover, even when it is not shown as a hero.
    if (data.cover_url) {
      const og = document.createElement('meta');
      og.setAttribute('property', 'og:image');
      og.content = data.cover_url;
      document.head.append(og);
    }

    parts.push(body);

    if (data.canonical_url) {
      const note = document.createElement('p');
      note.className = 'post-origin';
      note.append('Originally published on ' + (data.source || 'another site') + '. ');
      const a = document.createElement('a');
      a.href = data.canonical_url;
      a.target = '_blank';
      a.rel = 'noopener';
      a.textContent = 'Read it there';
      note.append(a, '.');
      parts.push(note);
    }

    article.replaceChildren(...parts);
  }
}
