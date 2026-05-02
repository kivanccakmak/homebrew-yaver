# This repository is deprecated

Yaver is now distributed **only** through npm.

## Install Yaver

```bash
npm install -g yaver-cli
yaver auth
yaver serve
```

Works on macOS (Apple Silicon + Intel), Linux (x64 + arm64), and Windows via WSL2. Requires Node.js 18+.

## Why one path?

A single `yaver` command, owned by the user who runs it. No system-user split, no `/root/.yaver` vs `/home/yaver/.yaver` drift, automatic updates with `npm install -g yaver-cli@latest`, no extra repo / tap / bucket to manage.

## What about Homebrew / apt / Scoop / AUR?

This repo will not receive future updates. Any version published here is stale; install via npm and use `yaver --version` to confirm you have the current release.

For Node itself, you can still use Homebrew (`brew install node`) or your distro's package manager — but Yaver itself comes from npm.

## Links

- Install page: https://yaver.io/download
- npm package: https://www.npmjs.com/package/yaver-cli
- Source: https://github.com/kivanccakmak/yaver.io
