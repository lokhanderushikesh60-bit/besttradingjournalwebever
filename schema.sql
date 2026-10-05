-- TRADEFORGE database schema
-- Run this in Supabase SQL Editor before connecting the site.

create table if not exists public.trades (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  traded_at timestamptz not null,
  symbol text not null,
  market text,
  direction text,
  session text,
  period_quality text,
  setup text,
  market_condition text,
  entry numeric,
  stop_loss numeric,
  take_profit numeric,
  exit_price numeric,
  risk_amount numeric default 0,
  pnl numeric default 0,
  r_multiple numeric default 0,
  result text,
  greed int default 1 check (greed between 1 and 10),
  fear int default 1 check (fear between 1 and 10),
  fomo int default 1 check (fomo between 1 and 10),
  revenge int default 1 check (revenge between 1 and 10),
  confidence int default 5 check (confidence between 1 and 10),
  discipline int default 5 check (discipline between 1 and 10),
  emotions text[] default '{}',
  mistakes text[] default '{}',
  followed_plan boolean default false,
  correct_risk boolean default false,
  good_entry boolean default false,
  good_exit boolean default false,
  correct_session boolean default false,
  patience boolean default false,
  notes text,
  lesson text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists trades_user_date_idx on public.trades(user_id, traded_at desc);

alter table public.trades enable row level security;

drop policy if exists "users can read own trades" on public.trades;
create policy "users can read own trades" on public.trades for select to authenticated using (auth.uid() = user_id);

drop policy if exists "users can insert own trades" on public.trades;
create policy "users can insert own trades" on public.trades for insert to authenticated with check (auth.uid() = user_id);

drop policy if exists "users can update own trades" on public.trades;
create policy "users can update own trades" on public.trades for update to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);

drop policy if exists "users can delete own trades" on public.trades;
create policy "users can delete own trades" on public.trades for delete to authenticated using (auth.uid() = user_id);

-- Optional: protect against accidental public access by ensuring only authenticated
-- clients receive table privileges. Review grants for your Supabase project before launch.
grant select, insert, update, delete on public.trades to authenticated;
revoke all on public.trades from anon;