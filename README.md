# Hermes Agent — Home Assistant Add-on Repository

Home Assistant add-on repository for running
[Hermes Agent](https://github.com/NousResearch/hermes-agent) (by Nous
Research) on Home Assistant OS.

## Install

1. Home Assistant → **Settings → Add-ons → Add-on Store**
2. Click the **⋮** menu (top right) → **Repositories**
3. Add: `https://github.com/devinslick/hermes-hassio-addon`
4. Refresh, then find **Hermes Agent** → **Install** (amd64 only)
5. Start the add-on. The web dashboard is at `http://<host>:8642`.

## Setup (first run)

1. Open `http://<home-assistant-host>:8642`
2. Configure a provider — e.g. OpenRouter:
   - Dashboard → settings, or edit `/data/.env` (via the add-on's terminal
     or SSH) and add `OPENROUTER_API_KEY=...`
3. Optional — Telegram bot:
   - Create a bot with @BotFather, then add `TELEGRAM_BOT_TOKEN=...` to
     `/data/.env` and restart the add-on.

All Hermes state (config, sessions, skills, memory) persists in the
add-on's `/data` volume — survives updates and restarts.

## Security note

The dashboard runs with `HERMES_DASHBOARD_INSECURE=1` (HTTP, no auth).
Keep the host on a trusted LAN. **Do not port-forward 8642.**

## Maintenance

- The add-on image (`devinslick/hermes-hassio`) is built by GitHub Actions
  on every push to `main`. To release a new version: bump `version:` in
  `hermes-agent/config.yaml`, the tag in
  `.github/workflows/build-hassio.yaml`, and `devinslick/hermes` base if
  needed — the tag must match `version:` exactly.
- Base image: `devinslick/hermes` (built from
  [homelab-resources](https://github.com/devinslick/homelab-resources)).

## Support

For Hermes itself: [hermes-agent docs](https://hermes-agent.nousresearch.com/docs/).
This packaging is personal/homelab — no support guarantee.
