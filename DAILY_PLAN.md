# Daily 6 PM Automation — Plan

This repo is driven by a Claude Code on the web **trigger** that runs daily at 6 PM
on branch `claude/daily-github-commits-6pm-*`. This file documents what each daily
run is intended to do, and what YOU need to configure for the fuller workflow.

## What each daily run does (when fully set up)

1. **Simple daily commit** — append a dated entry to `DAILY_LOG.md` (keeps the
   contribution graph active even if everything else is a no-op). ✅ active.
2. **Trending AI digest** — search GitHub + web for trending AI/LLM-agent repos
   and write `reports/trending-ai-repos-<date>.md`. ✅ active (discovery only).
3. **Work on issues in your repos** — pick an open issue in one of YOUR repos,
   implement a fix, open a draft PR. ⚠️ needs setup (see below).
4. **Contribute to a specific external repo** — fork + PR to a project YOU name
   and intend to engage with. ⚠️ needs you to name the repo (see below).

## Action items for you

- **Add your repos to the session scope.** This session can currently only touch
  `jyotisaini-3/warp` (which has 0 open issues). To let the daily run fix issues
  in your other repos, add them in the Claude Code web UI → environment/repo
  settings. Until then, item 3 has nothing to act on.
- **Name the external repo** for item 4. I will NOT auto-PR random trending repos
  you don't own — unsolicited automated PRs are spam and can get an account
  flagged. Tell me the specific project you want to contribute to and I'll fork
  and open real PRs there.
- **Update the trigger prompt** if you want the daily run to do items 2–4
  automatically. The trigger prompt currently says "Do daily commits." Edit it in
  the web UI to e.g.: "Append today's DAILY_LOG entry, regenerate the trending AI
  digest, and if open issues exist in my repos, fix one and open a draft PR."

## Guardrails

- No automated PRs to repos the user does not own / has not named.
- All PRs opened as drafts.
- Each run commits to the daily branch and updates the open PR.
