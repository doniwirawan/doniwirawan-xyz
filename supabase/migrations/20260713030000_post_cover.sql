-- Cover image shown on the blog index. Derived from the first image in the body
-- when a post is saved, so there is nothing extra to fill in by hand.

alter table public.posts add column if not exists cover_url text;
