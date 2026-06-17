#!/usr/bin/env bash
# Idempotent daily commit. Always exits 0 on success, never fails on an
# empty commit, and never reaches outside this repo's scope.
set -euo pipefail

DATE="$(date -u +%Y-%m-%d)"
LOG="DAILY_LOG.md"
BRANCH="$(git rev-parse --abbrev-ref HEAD)"

# Ensure the log file exists.
if [ ! -f "$LOG" ]; then
  printf '# Daily Log\n\nA running log of daily automated commits.\n\n## Entries\n\n' > "$LOG"
fi

# Append today's entry only if it is not already present (safe to re-run).
if ! grep -q "^- ${DATE}:" "$LOG"; then
  echo "- ${DATE}: Automated daily commit." >> "$LOG"
fi

git add "$LOG"

# Only commit when something is actually staged, so a re-run never fails.
if git diff --cached --quiet; then
  echo "Nothing to commit for ${DATE}; already up to date."
else
  git commit -m "Daily commit ${DATE}"
fi

# Push current branch; "Everything up-to-date" is a success (exit 0).
git push -u origin "$BRANCH"
