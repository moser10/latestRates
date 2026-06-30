# latestRates

ECB reference FX rates (Frankfurter API).

## Quick start

```bash
npm run db:create
# Paste database_id into wrangler.toml, then:
npx wrangler d1 execute latestRates-db --local --file=./schema.sql
npm run dev
```

Open **http://localhost:8787**

Local dev without GitHub OAuth: set `QUOTA_DISABLED = "true"` in `wrangler.toml`.

## Limits

- **32** free uses per IP on the official deployment.
- **Star this repo** on GitHub and sign in via GitHub OAuth for **unlimited** use.
- Unstar is detected on the next check (~every 6 hours).

Forks may set `QUOTA_DISABLED=true` or change `GITHUB_STAR_REPO`.

## GitHub OAuth

1. Create OAuth App → callback `http://localhost:8787/api/github/callback`
2. `wrangler secret put GITHUB_CLIENT_ID` and `GITHUB_CLIENT_SECRET`
3. Set `GITHUB_STAR_REPO = "your-user/latestRates"`

## License

MIT — built from [1024201](https://1024201.com) toolbox; uses third-party APIs (LRCLIB, Deezer, Frankfurter, LibreTranslate, mammoth, html2pdf.js).
