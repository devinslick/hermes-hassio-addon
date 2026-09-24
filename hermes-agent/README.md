# Hermes Agent — Home Assistant Add-on

Runs [Hermes Agent](https://github.com/NousResearch/hermes-agent) (by Nous
Research) as a Home Assistant OS add-on, with a web dashboard on port 8642
and persistent state in `/data`.

Based on the custom image `devinslick/hermes` (s6-overlay v3 init, matches
HA Supervisor's add-on model with `init: false`).

## Install

Settings → Add-ons → Add-on Store → ⋮ → Repositories → add
`https://github.com/devinslick/hermes-hassio-addon`, then install
**Hermes Agent**.

## Setup

1. Open `http://<host>:8642` — the dashboard.
2. Add provider API keys to `/data/.env` (e.g. `OPENROUTER_API_KEY=...`)
   — or use the dashboard's provider setup.
3. Optional: Telegram bot — put `TELEGRAM_BOT_TOKEN` in `/data/.env` and
   restart the add-on.

## Notes

- Dashboard is HTTP without auth (`HERMES_DASHBOARD_INSECURE=1`). Keep the
  mini PC on a trusted LAN; do not port-forward 8642.
- Architecture: amd64 only.
- State survives add-on restarts/updates (persisted in `/data`).
