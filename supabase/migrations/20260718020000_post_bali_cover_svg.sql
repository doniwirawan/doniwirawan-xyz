-- Give the post a title cover: a minimalist SVG of the headline, matching the
-- other blog covers (images/blog/cover-*.svg). The infographic stays inline in
-- the body — since the cover now differs from the body's first image, the cover
-- shows as the hero and the infographic reads as an in-article figure.

update public.posts
set cover_url = 'https://doniwirawan.xyz/images/blog/cover-bali-tanah.svg'
where slug = 'bali-tidak-kehabisan-tanah';
