# github-keepalive-10min

Standalone GitHub keepalive project (10-minute interval).

## What it does
- Runs a GitHub Actions workflow every 10 minutes.
- Updates `.keepalive/heartbeat.txt` and `.keepalive/heartbeat_local.txt`.
- Commits and pushes automatically via `GITHUB_TOKEN`.

## Files
- `.github/workflows/keepalive.yml`
- `scripts/keepalive.sh`
- `.keepalive/`

## Requirements
In repo Settings -> Actions -> General:
- Actions enabled
- Workflow permissions set to `Read and write permissions`

## GPT2API Render Ping
- Additional workflow: `.github/workflows/gpt2api-render-ping.yml`
- Pings Render every 5 minutes to reduce free-plan idle spin-down.
- Optional secret: `TARGET_URL` (defaults to `https://gpt2api-bridge.onrender.com/healthz`)
