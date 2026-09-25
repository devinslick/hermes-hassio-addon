# Hermes Agent — Home Assistant add-on image
#
# Thin layer on top of devinslick/hermes (the homelab-resources k8s build,
# which already ships s6-overlay v3 as PID 1 via /init — matches HA
# Supervisor's requirement when the add-on sets init: false).
#
# Built and pushed by GitHub Actions in this repo; the add-on's
# config.yaml `image: devinslick/hermes-hassio` + `version:` tag must
# match the pushed tag exactly.

FROM devinslick/hermes:latest

# Supervisor image validation labels (arch must match config.yaml)
LABEL \
    io.hass.type="addon" \
    io.hass.version="1.0.0" \
    io.hass.arch="amd64"

# HA Supervisor mounts /data root-owned. The base image drops to the
# `hermes` user, so fix ownership at boot before any service starts.
# (cont-init.d runs under s6 during container startup.)
COPY hassio-init.sh /etc/cont-init.d/02-hassio-init
RUN chmod +x /etc/cont-init.d/02-hassio-init

# Hermes state (config.yaml, .env, sessions, skills, memory) lives in
# /data — the Supervisor-managed persistent volume. Survives add-on
# restarts, updates, and rebuilds.
ENV HERMES_HOME=/data \
    HERMES_DASHBOARD_HOST=0.0.0.0 \
    HERMES_DASHBOARD_INSECURE=1
