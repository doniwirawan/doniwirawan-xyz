-- Page views, stored here rather than only in Vercel Web Analytics, so the
-- admin page can show them next to the posts they belong to.
--
-- Visitors never write to the table directly. They call record_view(), which is
-- security definer: it can insert one row and nothing else. That way anon has
-- no insert grant to abuse, and no way to read what anyone else viewed.

create table if not exists public.page_views (
  id        bigint generated always as identity primary key,
  path      text not null,
  slug      text,
  referrer  text,
  viewed_at timestamptz not null default now()
);

create index if not exists page_views_viewed_at_idx on public.page_views (viewed_at desc);
create index if not exists page_views_slug_idx on public.page_views (slug) where slug is not null;

alter table public.page_views enable row level security;

-- No anon policy at all: without one, RLS denies everything, which is the point.
drop policy if exists "admin reads views" on public.page_views;
create policy "admin reads views"
  on public.page_views for select to authenticated
  using (auth.jwt() ->> 'email' = 'doniwirawan166@gmail.com');

-- Recording one view. Values are truncated rather than rejected: a malformed
-- path should not cost us the visit.
create or replace function public.record_view(
  p_path text,
  p_slug text default null,
  p_referrer text default null
) returns void
language plpgsql
security definer
set search_path = public
as $$
begin
  if p_path is null or p_path = '' then
    return;
  end if;

  -- The admin's own pages are not an audience.
  if p_path like '/admin%' then
    return;
  end if;

  insert into public.page_views (path, slug, referrer)
  values (left(p_path, 300), left(p_slug, 200), left(p_referrer, 300));
end;
$$;

grant execute on function public.record_view(text, text, text) to anon, authenticated;

-- Aggregates for the admin page. Security definer so it can read past the RLS
-- policy above, with the email check restated here — otherwise this function
-- would hand anyone the whole table.
create or replace function public.view_summary(p_days int default 30)
returns table (path text, slug text, views bigint, last_viewed timestamptz)
language plpgsql
security definer
set search_path = public
as $$
begin
  if auth.jwt() ->> 'email' is distinct from 'doniwirawan166@gmail.com' then
    raise exception 'forbidden';
  end if;

  return query
    select v.path,
           max(v.slug) as slug,
           count(*)    as views,
           max(v.viewed_at) as last_viewed
    from public.page_views v
    where v.viewed_at >= now() - make_interval(days => greatest(p_days, 1))
    group by v.path
    order by count(*) desc;
end;
$$;

grant execute on function public.view_summary(int) to authenticated;
