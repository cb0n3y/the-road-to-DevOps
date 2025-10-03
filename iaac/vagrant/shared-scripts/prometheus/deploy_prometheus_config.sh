#!/bin/bash
set -euo pipefail

PROM_CONFIG_SRC="./prometheus.yml"          # your local config file
PROM_CONFIG_DEST="/etc/prometheus/prometheus.yml"
PROM_SERVICE="prometheus"

if [ ! -f "$PROM_CONFIG_SRC" ]; then
  echo "Error: $PROM_CONFIG_SRC does not exist."
  exit 1
fi

echo "[+] Copying Prometheus config..."
sudo cp "$PROM_CONFIG_SRC" "$PROM_CONFIG_DEST"

echo "[+] Restarting Prometheus service..."
sudo systemctl restart "$PROM_SERVICE"

echo "[+] Prometheus config deployed and service restarted."
