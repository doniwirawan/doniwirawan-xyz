-- Blog schema for doniwirawan.xyz
-- Paste this into the Supabase SQL editor and run it once.
--
-- Before running, replace the email below with the address you will log in with.
-- Only that account can create, edit or delete posts. Everyone else can read
-- published posts only.

create table if not exists public.posts (
  id           uuid primary key default gen_random_uuid(),
  slug         text unique not null,
  title        text not null,
  excerpt      text,
  body         text not null default '',
  published    boolean not null default false,
  published_at timestamptz,
  created_at   timestamptz not null default now(),
  updated_at   timestamptz not null default now()
);

create index if not exists posts_published_idx
  on public.posts (published, published_at desc);

alter table public.posts enable row level security;

-- Anyone (including logged-out visitors) may read published posts.
drop policy if exists "public reads published posts" on public.posts;
create policy "public reads published posts"
  on public.posts for select
  using (published = true);

-- Only the admin account may read drafts and write anything.
drop policy if exists "admin manages posts" on public.posts;
create policy "admin manages posts"
  on public.posts for all
  to authenticated
  using      (auth.jwt() ->> 'email' = 'doniwirawan166@gmail.com')
  with check (auth.jwt() ->> 'email' = 'doniwirawan166@gmail.com');

-- Keep updated_at honest.
create or replace function public.touch_updated_at()
returns trigger language plpgsql as $$
begin
  new.updated_at = now();
  return new;
end $$;

drop trigger if exists posts_touch_updated_at on public.posts;
create trigger posts_touch_updated_at
  before update on public.posts
  for each row execute function public.touch_updated_at();
