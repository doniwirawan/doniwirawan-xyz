-- Storage for images embedded in blog posts.
-- Public read (they appear on a public blog); only the admin may upload or delete.

insert into storage.buckets (id, name, public)
values ('blog', 'blog', true)
on conflict (id) do nothing;

drop policy if exists "public reads blog images" on storage.objects;
create policy "public reads blog images"
  on storage.objects for select
  using (bucket_id = 'blog');

drop policy if exists "admin writes blog images" on storage.objects;
create policy "admin writes blog images"
  on storage.objects for insert
  to authenticated
  with check (
    bucket_id = 'blog'
    and auth.jwt() ->> 'email' = 'doniwirawan166@gmail.com'
  );

drop policy if exists "admin updates blog images" on storage.objects;
create policy "admin updates blog images"
  on storage.objects for update
  to authenticated
  using (
    bucket_id = 'blog'
    and auth.jwt() ->> 'email' = 'doniwirawan166@gmail.com'
  );

drop policy if exists "admin deletes blog images" on storage.objects;
create policy "admin deletes blog images"
  on storage.objects for delete
  to authenticated
  using (
    bucket_id = 'blog'
    and auth.jwt() ->> 'email' = 'doniwirawan166@gmail.com'
  );
