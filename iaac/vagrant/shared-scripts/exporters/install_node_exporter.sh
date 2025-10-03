#!/bin/bash
set -euo pipefail

NODE_EXPORTER_VERSION="${NODE_EXPORTER_VERSION:-1.9.0}"
USER="prometheus"
GROUP="prometheus"
INSTALL_DIR="/opt"
SCRAPE_PORT=9100
SCRAPE_JOB_NAME="${SCRAPE_JOB_NAME:-node_exporter}"
PROM_CONFIG_PATH="${PROM_CONFIG_PATH:-/etc/prometheus/prometheus.yml}"
AUTO_REGISTER="${AUTO_REGISTER:-true}"

install_node_exporter() {
    NODE_EXPORTER_VERSION="1.9.0"
    USER="prometheus"
    GROUP="prometheus"

    echo "[+] Creating user and group for node_exporter..."
    id -u $USER &>/dev/null || useradd --no-create-home --shell /bin/false $USER
    getent group $GROUP &>/dev/null || groupadd $GROUP

    echo "[+] Downloading Node Exporter ${NODE_EXPORTER_VERSION}..."
    cd /opt
    curl -sLO https://github.com/prometheus/node_exporter/releases/download/v${NODE_EXPORTER_VERSION}/node_exporter-${NODE_EXPORTER_VERSION}.linux-amd64.tar.gz
    tar xzf node_exporter-${NODE_EXPORTER_VERSION}.linux-amd64.tar.gz
    mv node_exporter-${NODE_EXPORTER_VERSION}.linux-amd64 node_exporter
    rm -f node_exporter-${NODE_EXPORTER_VERSION}.linux-amd64.tar.gz

    echo "[+] Setting permissions..."
    chown -R $USER:$GROUP /opt/node_exporter

    echo "[+] Creating systemd unit for node_exporter..."
    cat <<EOF > /etc/systemd/system/node_exporter.service
[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=prometheus
Group=prometheus
Type=simple
ExecStart=/opt/node_exporter/node_exporter \
--web.listen-address=0.0.0.0:9100

[Install]
WantedBy=multi-user.target
EOF

    echo "[+] Enabling and starting node_exporter..."
    systemctl daemon-reexec
    systemctl daemon-reload
    systemctl enable --now node_exporter
}

install_node_exporter