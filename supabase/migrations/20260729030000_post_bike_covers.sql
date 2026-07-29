-- Title covers for the two cycling posts: minimalist SVGs matching the other
-- blog covers (images/blog/cover-*.svg). Neither post has an image in its body,
-- so each cover shows as the hero rather than duplicating anything inline.

update public.posts
set cover_url = 'https://doniwirawan.xyz/images/blog/cover-gravel-bike.svg'
where slug = 'building-my-dream-gravel-bike';

update public.posts
set cover_url = 'https://doniwirawan.xyz/images/blog/cover-hidden-cost-bicycle.svg'
where slug = 'the-hidden-cost-of-owning-a-bicycle';
