# SkillHub API

REST API for the SkillHub Flutter application. It includes JWT authentication, players, subscriptions, evaluations, finance transactions, messages, notifications, and dashboard statistics.

## Run locally

```powershell
cd backend
npm install
npm run db:push
npm run db:seed
npm run dev
```

The API is available at `http://localhost:3000/api/v1`.

Default development account:

- Email: `admin@skillhub.com`
- Password: `Admin123!`

If login fails locally, reset and seed the PostgreSQL database:

```powershell
cd backend
npx prisma db push --force-reset
npm run db:seed
npm start
```

Copy `.env.example` to `.env`, configure the pooled `DATABASE_URL`, the migration `DIRECT_URL`, and replace `JWT_SECRET` before deployment. The API uses PostgreSQL in development and production.

## Main endpoints

All endpoints except health and login require `Authorization: Bearer <token>`.

| Method | Endpoint | Purpose |
| --- | --- | --- |
| GET | `/health` | Service health |
| POST | `/auth/login` | Login |
| GET | `/auth/me` | Current user |
| GET/POST | `/players` | Search/list and create players |
| GET/PUT/DELETE | `/players/:id` | Player details and mutations |
| GET/POST | `/subscriptions` | Subscriptions |
| GET/POST | `/evaluations` | Evaluations |
| GET/POST | `/finance/transactions` | Income and expenses |
| GET/POST/DELETE | `/messages` | Message history and scheduling |
| GET/PATCH/DELETE | `/notifications` | Notifications |
| GET | `/dashboard` | Aggregated dashboard stats |

Run `npm test` after seeding to execute the API smoke tests.
