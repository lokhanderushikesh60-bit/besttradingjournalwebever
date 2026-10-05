# TradeForge — Trading Journal

A psychology-first trading journal designed to turn every trade into measurable feedback.

## Core design
- Email/password account authentication.
- Cloud-backed trades linked to the authenticated user.
- Psychology captured on every trade: greed, fear, FOMO, revenge urge, confidence, discipline.
- Emotions and mistakes are multi-select tags.
- Session and right/wrong trading-period tracking.
- Live dashboard averages and breakdowns calculated from all saved trades.
- Mistake analysis combines frequency and P&L impact.
- Rule-following vs outcome analysis separates execution quality from luck.
- Export/backup tools.
- Supabase Postgres + Row Level Security for per-user data isolation.

## Setup
1. Create a Supabase project.
2. Run schema.sql in the Supabase SQL Editor.
3. Enable email/password authentication.
4. Put the project's URL and publishable/anon key into config.js.
5. In Supabase Authentication > URL Configuration, add the final GitHub Pages URL as a Site URL and redirect URL.
6. Commit the files to GitHub Pages.

Do not put a service_role key in config.js.

## Important
The browser is only the interface. The journal data lives in the database. Logging out, clearing browser cache, changing devices, or deploying a new frontend does not delete the cloud records. Database backups/export should still be used as an additional safety measure.