#!/usr/bin/env bash
set -euo pipefail

mkdir -p .keepalive

date -u +"%Y-%m-%dT%H:%M:%SZ" > .keepalive/heartbeat.txt
date +"%Y-%m-%d %H:%M:%S %Z" > .keepalive/heartbeat_local.txt

git config user.name "github-actions[bot]"
git config user.email "41898282+github-actions[bot]@users.noreply.github.com"

git add .keepalive/heartbeat.txt .keepalive/heartbeat_local.txt

if git diff --cached --quiet; then
  echo "No changes to commit"
  exit 0
fi

git commit -m "chore: keepalive $(date -u +'%Y-%m-%dT%H:%M:%SZ')"
git push
