-- Posts that were first published somewhere else (e.g. Medium) keep a link back
-- to the original, so search engines treat that copy as canonical rather than
-- treating this one as duplicate content.

alter table public.posts add column if not exists canonical_url text;
alter table public.posts add column if not exists source text;
