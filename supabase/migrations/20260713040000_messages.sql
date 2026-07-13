-- Contact form messages.
--
-- Anyone may send one (that is the point of a contact form), but nobody can read
-- them back — not even with the anon key, which ships to every browser. Only the
-- admin can read, mark as read, or delete.

create table if not exists public.messages (
  id         uuid primary key default gen_random_uuid(),
  name       text not null,
  email      text not null,
  message    text not null,
  read       boolean not null default false,
  created_at timestamptz not null default now()
);

create index if not exists messages_created_idx on public.messages (created_at desc);

alter table public.messages enable row level security;

-- Send: anyone. Note there is no matching select policy, so an insert with
-- `return=representation` would fail — the form must not ask for the row back.
drop policy if exists "anyone sends a message" on public.messages;
create policy "anyone sends a message"
  on public.messages for insert
  to anon, authenticated
  with check (
    length(name) between 1 and 100
    and length(email) between 3 and 200
    and length(message) between 1 and 5000
  );

drop policy if exists "admin reads messages" on public.messages;
create policy "admin reads messages"
  on public.messages for select
  to authenticated
  using (auth.jwt() ->> 'email' = 'doniwirawan166@gmail.com');

drop policy if exists "admin updates messages" on public.messages;
create policy "admin updates messages"
  on public.messages for update
  to authenticated
  using (auth.jwt() ->> 'email' = 'doniwirawan166@gmail.com');

drop policy if exists "admin deletes messages" on public.messages;
create policy "admin deletes messages"
  on public.messages for delete
  to authenticated
  using (auth.jwt() ->> 'email' = 'doniwirawan166@gmail.com');
