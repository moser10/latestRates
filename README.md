# latestRates

ECB reference exchange rates via [Frankfurter API](https://www.frankfurter.app), cached 6 hours.

## 本地直接用（零配置）

Fork 或 clone 后，**不需要 Cloudflare 账号、不需要 token、不需要配数据库**：

```bash
git clone https://github.com/moser10/latestRates.git
cd latestRates
npm run dev
```

浏览器打开 **http://localhost:8787** 即可。

默认 `wrangler.toml` 里 `QUOTA_DISABLED = "true"`，本地**无限次**刷新，也**不用**配 GitHub OAuth。

---

## `wrangler.toml` 是什么？

这是 **Cloudflare Workers 的部署配置文件**（Worker 名、静态目录、公开变量等）。

- ✅ 会出现在 GitHub 里，但**只有非敏感配置**
- ❌ **不会**也**不应该**写 Cloudflare API Token、GitHub Client Secret
- 密钥用 `wrangler secret put` 存在 **Cloudflare 控制台**，**不进 git**，别人 clone 也看不到

**只想本地用？** 可以忽略部署相关段落，只跑 `npm run dev`。

---

## 别人 fork 会用我的 Cloudflare 吗？

**不会。**

| 场景 | 需要什么 |
|------|----------|
| 本地自己用 | 仅 `npm run dev`，默认无限次 |
| 自己挂到公网 | **各自**的 Cloudflare 账号 + **各自**的 token |
| 关掉限次 | `QUOTA_DISABLED = "true"`（默认已是） |

你的 CF token 只在你自己电脑或你自己的 CF 账号里；仓库里没有任何人的 token。

---

## 可选：公网部署 + Star 解锁

仅当你要把站点**挂到公网**且想启用「免费 32 次 → Star 本仓库 → 无限次」时才需要下面步骤。

### 1. 部署到你自己的 Cloudflare

```bash
npm run db:create          # 创建 D1，把 database_id 填入 wrangler.toml
npx wrangler d1 execute latest-rates-db --remote --file=./schema.sql
# wrangler.toml 里设 QUOTA_DISABLED = "false"
npm run deploy             # 使用你自己的 CF 登录/token
```

### 2. GitHub OAuth（与 Cloudflare 无关）

在 **GitHub** 创建 OAuth App：Settings → Developer settings → OAuth Apps。

- **Callback URL**（授权完跳回你的站点）：
  - 本地调试：`http://localhost:8787/api/github/callback`
  - 线上：`https://你的域名/api/github/callback`

把 Client ID / Secret **只**存到 Cloudflare（不进仓库）：

```bash
wrangler secret put GITHUB_CLIENT_ID
wrangler secret put GITHUB_CLIENT_SECRET
```

`wrangler.toml` 里已有 `GITHUB_STAR_REPO = "moser10/latestRates"`（可改成你自己的 fork）。

---

## 限次规则（仅 `QUOTA_DISABLED = "false"` 时生效）

- 未 Star：每 IP **32 次**汇率请求
- Star 对应仓库并用 GitHub 登录：**无限次**
- 取消 Star：约每 6 小时复查一次，会恢复 32 次上限

---

## License

MIT — from [1024201](https://1024201.com) toolbox. Rates: Frankfurter / ECB reference data.
