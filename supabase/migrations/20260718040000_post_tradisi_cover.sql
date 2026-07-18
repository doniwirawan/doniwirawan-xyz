-- Title cover for the "Tradisi yang Bertahan Harus Berani Berubah" post: a
-- minimalist SVG headline card (canang + flowing-water motif) matching the
-- other blog covers (images/blog/cover-*.svg).

update public.posts
set cover_url = 'https://doniwirawan.xyz/images/blog/cover-tradisi.svg'
where slug = 'tradisi-yang-bertahan-harus-berani-berubah';
