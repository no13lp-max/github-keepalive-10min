#!/usr/bin/env bash
set -euo pipefail

TARGET_URL="${TARGET_URL:-https://gpt2api-bridge.onrender.com/healthz}"
TIMEOUT="${TIMEOUT_SECONDS:-25}"

echo "[ping] $TARGET_URL"
code=$(curl -sS -o /tmp/gpt2api_keepalive_body.txt -w '%{http_code}' --max-time "$TIMEOUT" "$TARGET_URL")

echo "[http] $code"
if [ "$code" -ge 200 ] && [ "$code" -lt 500 ]; then
  exit 0
fi

cat /tmp/gpt2api_keepalive_body.txt || true
exit 1
