# latestRates

欧洲央行参考汇率（Frankfurter API），约 6 小时缓存更新。

## 本地运行

```bash
git clone https://github.com/moser10/latestRates.git
cd latestRates
npm run dev
```

浏览器访问 http://localhost:8787

## 使用次数

公网部署时：每 IP 32 次刷新。在 GitHub [Star 本仓库](https://github.com/moser10/latestRates) 并用 GitHub 登录后可无限使用。

本地默认 `QUOTA_DISABLED=true`，不限次数。

## License

MIT
