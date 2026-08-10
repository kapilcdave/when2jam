create extension if not exists "pgcrypto";

create table if not exists public.events (
  id uuid primary key default gen_random_uuid(),
  name text not null default 'Untitled Jam',
  start_date timestamptz not null,
  end_date timestamptz not null,
  created_at timestamptz not null default now(),
  constraint events_date_order check (end_date >= start_date)
);

create table if not exists public.responses (
  id uuid primary key default gen_random_uuid(),
  event_id uuid not null references public.events(id) on delete cascade,
  user_name text not null,
  availability integer[] not null default '{}',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint responses_user_name_not_blank check (length(trim(user_name)) > 0),
  constraint responses_availability_values check (
    array_position(availability, null) is null
    and availability <@ array[0, 1]::integer[]
  ),
  constraint responses_event_user_unique unique (event_id, user_name)
);

create index if not exists responses_event_id_idx on public.responses(event_id);

create or replace function public.set_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists set_responses_updated_at on public.responses;
create trigger set_responses_updated_at
before update on public.responses
for each row
execute function public.set_updated_at();

alter table public.events enable row level security;
alter table public.responses enable row level security;

drop policy if exists "Anyone can read events" on public.events;
create policy "Anyone can read events"
on public.events for select
to anon
using (true);

drop policy if exists "Anyone can create events" on public.events;
create policy "Anyone can create events"
on public.events for insert
to anon
with check (true);

drop policy if exists "Anyone can read responses" on public.responses;
create policy "Anyone can read responses"
on public.responses for select
to anon
using (true);

drop policy if exists "Anyone can create responses" on public.responses;
create policy "Anyone can create responses"
on public.responses for insert
to anon
with check (true);

drop policy if exists "Anyone can update responses" on public.responses;
create policy "Anyone can update responses"
on public.responses for update
to anon
using (true)
with check (true);

do $$
begin
  if not exists (
    select 1
    from pg_publication_tables
    where pubname = 'supabase_realtime'
      and schemaname = 'public'
      and tablename = 'responses'
  ) then
    alter publication supabase_realtime add table public.responses;
  end if;
end $$;
