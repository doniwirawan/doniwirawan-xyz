-- Three posts are written in Indonesian but were served inside <html lang="en">,
-- which tells search engines and screen readers the wrong language. A column
-- rather than guessing from the text: detection is fragile, and the author knows.

alter table public.posts
  add column if not exists lang text not null default 'en';

update public.posts set lang = 'id'
where slug in (
  'tradisi-yang-bertahan-harus-berani-berubah',
  'bali-tidak-kehabisan-tanah',
  'cerita-menjadi-seorang-lead-gdsc-chapter-instiki'
);
