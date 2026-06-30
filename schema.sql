CREATE TABLE IF NOT EXISTS usage_quota (
  quota_key TEXT PRIMARY KEY,
  uses INTEGER NOT NULL DEFAULT 0
);
CREATE TABLE IF NOT EXISTS github_sessions (
  session_id TEXT PRIMARY KEY,
  github_id INTEGER NOT NULL,
  github_login TEXT NOT NULL,
  access_token TEXT NOT NULL,
  starred INTEGER NOT NULL DEFAULT 0,
  checked_at TEXT NOT NULL
);
