#!/command/with-contenv bash
# Home Assistant add-on boot init for Hermes.
# Runs under s6 cont-init.d before the gateway service starts.

echo "[hassio-init] preparing /data for hermes user"

# Supervisor mounts /data root-owned; the image runs as `hermes`.
chown -R hermes:hermes /data 2>/dev/null || true

# /tmp sticky bit — base image handles this too, but be safe for tools
# that hardcode /tmp paths.
chmod 1777 /tmp

# Warn (not fail) if the dashboard will be exposed without auth.
echo "[hassio-init] done — dashboard on 0.0.0.0:8642 (HERMES_DASHBOARD_INSECURE=1, keep LAN-only)"
