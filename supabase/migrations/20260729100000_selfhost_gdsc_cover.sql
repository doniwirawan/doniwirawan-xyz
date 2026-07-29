-- This post was cross-posted from Medium and its cover was still being served
-- from Medium's CDN, through a 301. Crawlers follow redirects, so it worked,
-- but it is a third-party dependency on an image this site does not control.
-- Now served from here, like every other cover.

update public.posts
set cover_url = 'https://doniwirawan.xyz/images/blog/cover-gdsc-instiki.jpg'
where slug = 'cerita-menjadi-seorang-lead-gdsc-chapter-instiki';
