#!/bin/bash
set -euo pipefail

PROM_CONFIG_PATH="${PROM_CONFIG_PATH:-/etc/prometheus/prometheus.yml}"
SCRAPE_JOB_NAME="${1:-}"
SCRAPE_TARGET="${2:-}"

if [[ -z "$SCRAPE_JOB_NAME" || -z "$SCRAPE_TARGET" ]]; then
  echo "Usage: $0 <job_name> <target_ip:port>"
  exit 1
fi

if [[ ! -f "$PROM_CONFIG_PATH" ]]; then
  echo "Error: Prometheus config file not found at $PROM_CONFIG_PATH"
  exit 1
fi

# Backup before modifying
cp "$PROM_CONFIG_PATH" "${PROM_CONFIG_PATH}.bak.$(date +%Y%m%d%H%M%S)"

# Check if job already exists (simple grep)
if grep -q "job_name: '$SCRAPE_JOB_NAME'" "$PROM_CONFIG_PATH"; then
  echo "Job '$SCRAPE_JOB_NAME' already exists in $PROM_CONFIG_PATH. No changes made."
  exit 0
fi

echo "[+] Adding job '$SCRAPE_JOB_NAME' with target '$SCRAPE_TARGET'..."

cat <<EOF >> "$PROM_CONFIG_PATH"

  - job_name: '$SCRAPE_JOB_NAME'
    static_configs:
      - targets: ['$SCRAPE_TARGET']
EOF

echo "[+] Done. Restarting Prometheus service..."

if systemctl is-active --quiet prometheus; then
  systemctl restart prometheus
  echo "[+] Prometheus restarted successfully."
else
  echo "Warning: Prometheus service not running or systemctl not available."
fi
