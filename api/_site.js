// Shared by the server-rendered post page and the sitemap.
//
// Posts used to come from Supabase over PostgREST. They now live in
// data/posts.json, which ships with the site: the blog keeps working whether or
// not the database is up, and a post render costs no network call. The file
// holds published posts only — a static file has no row-level security, so
// nothing unpublished may go in it.
//
// Editing a post means editing that file (and committing it), not the database.

import { readFileSync } from 'node:fs';

export const SITE = 'https://doniwirawan.xyz';
export const AUTHOR = 'Doni Wirawan';

// Read once per cold start, then serve from memory.
let cache = null;

// Every published post, newest first — the order data/posts.json is written in.
export function allPosts() {
  if (!cache) {
    cache = JSON.parse(
      readFileSync(new URL('../data/posts.json', import.meta.url), 'utf8')
    );
  }
  return cache;
}

export function postBySlug(slug) {
  return allPosts().find((p) => p.slug === slug) || null;
}

// Three other posts to offer at the end of one.
export function otherPosts(slug, limit = 3) {
  return allPosts().filter((p) => p.slug !== slug).slice(0, limit);
}

export const escapeHtml = (s) =>
  String(s ?? '')
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;');
