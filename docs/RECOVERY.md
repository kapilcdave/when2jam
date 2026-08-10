# when2jam recovery

The replacement Supabase project is `yuyuibaagyhtvxolheoe`.

The original deployed Vercel bundle pointed at Supabase project ref `wflwbjwjseuijbkrvgnj`. That inactive project was deleted because the old event data was no longer needed.

## Option A: Resume the original project

1. Open the Supabase dashboard and find project `wflwbjwjseuijbkrvgnj`.
2. Resume or restore the project.
3. In Supabase, open Project Settings > API and copy:
   - Project URL
   - anon public key
4. In Vercel, open the `when2jam` project settings and set:
   - `NEXT_PUBLIC_SUPABASE_URL`
   - `NEXT_PUBLIC_SUPABASE_ANON_KEY`
5. Redeploy the current production branch.

## Option B: Create a replacement Supabase project

Use this path if the old project cannot be resumed or the old data is not needed.

1. Create a new Supabase project.
2. Open SQL Editor and run `supabase/migrations/0001_initial_schema.sql`.
3. Open Database > Replication/Realtime and confirm Realtime is enabled for `public.responses`.
4. Copy the new Project URL and anon public key into Vercel environment variables:
   - `NEXT_PUBLIC_SUPABASE_URL`
   - `NEXT_PUBLIC_SUPABASE_ANON_KEY`
5. Redeploy the Vercel project.

Old event links use UUIDs from the original database. They will only keep working if the original Supabase project and data are restored. A replacement project will make the app usable again for new events, but old links will not have their old data unless you restore/import that data.

## Local check

Create `.env.local` from `.env.example`, then run:

```bash
npm install
npm run build
npm run dev
```

The app requires anonymous browser reads/writes because it intentionally has no sign-in flow.
