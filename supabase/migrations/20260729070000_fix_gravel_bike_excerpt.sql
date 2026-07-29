-- The excerpt still quoted the pre-correction total. It is the line that shows
-- on the blog index card and in link previews, so it was contradicting the post
-- it links to.

update public.posts
set excerpt = replace(excerpt, 'Rp25.3 million', 'Rp25.5 million')
where slug = 'building-my-dream-gravel-bike';
