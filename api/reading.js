// Books from my public Goodreads shelves.
//
// Goodreads retired their API in 2020, so RSS is the only supported route left.
// A browser cannot fetch it directly (no CORS headers), hence this function.
// It returns titles, authors, ratings and cover art — nothing private.

const USER = '140927071';
const FEED = (shelf) =>
  `https://www.goodreads.com/review/list_rss/${USER}?shelf=${shelf}`;

const pick = (item, tag) => {
  const m = item.match(new RegExp(`<${tag}>(?:<!\\[CDATA\\[)?([\\s\\S]*?)(?:\\]\\]>)?</${tag}>`));
  return m ? m[1].trim() : '';
};

async function shelf(name, limit) {
  const r = await fetch(FEED(name), {
    headers: { 'User-Agent': 'doniwirawan.xyz' },
  });
  if (!r.ok) throw new Error(`${name}: ${r.status}`);
  const xml = await r.text();

  const items = xml.match(/<item>[\s\S]*?<\/item>/g) || [];
  return items.slice(0, limit).map((item) => ({
    title: pick(item, 'title'),
    author: pick(item, 'author_name'),
    rating: Number(pick(item, 'user_rating')) || 0,
    year: pick(item, 'book_published'),
    cover: pick(item, 'book_large_image_url') || pick(item, 'book_medium_image_url'),
    link: pick(item, 'link'),
  }));
}

export default async function handler(req, res) {
  try {
    const [current, read] = await Promise.all([
      shelf('currently-reading', 2),
      shelf('read', 8),
    ]);

    // Goodreads moves slowly and rate-limits hard. Cache it.
    res.setHeader('Cache-Control', 's-maxage=21600, stale-while-revalidate=86400');
    return res.status(200).json({ current, read });
  } catch (err) {
    console.error(err);
    return res.status(502).json({ error: 'Could not reach Goodreads.', detail: String(err.message) });
  }
}
