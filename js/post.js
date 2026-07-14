// Client-side post renderer.
//
// Published posts are server-rendered by /api/post, so this file does not run for
// them. It is the fallback for everything the server cannot see: an admin's own
// drafts (RLS hides those from the anonymous server fetch), and any moment when
// Supabase is unreachable from the function. Same rendering, done in the browser
// with the visitor's own session.

import { createClient } from 'https://esm.sh/@supabase/supabase-js@2';
import { marked } from 'https://esm.sh/marked@12';
import DOMPurify from 'https://esm.sh/dompurify@3';

const db = createClient(window.SUPABASE_URL, window.SUPABASE_ANON_KEY);
const article = document.getElementById('post');
const slug = decodeURIComponent(location.pathname.replace(/^\/blog\/?/, '').replace(/\/$/, ''));

const fmt = (d) => new Date(d).toLocaleDateString('en-GB', {
  day: 'numeric', month: 'long', year: 'numeric'
});

if (!slug) {
  location.replace('/blog');
} else {
  // No published filter here on purpose: RLS decides. The public can only read
  // published rows, while an admin session (set at /admin, same origin, so
  // supabase-js reuses it) can also read its own drafts — which makes previewing
  // a draft just work.
  const { data, error } = await db
    .from('posts')
    .select('title, excerpt, body, published, published_at, canonical_url, source, cover_url')
    .eq('slug', slug)
    .maybeSingle();

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

    // Only an admin can see this at all — RLS hides drafts from everyone else.
    if (!data.published) {
      const flag = document.createElement('div');
      flag.className = 'callout';
      const p = document.createElement('p');
      const strong = document.createElement('strong');
      strong.textContent = 'Draft preview.';
      p.append(strong, ' This post is not published. Nobody else can see it — you are seeing it because you are signed in.');
      flag.append(p);
      parts.push(flag);
    }

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
