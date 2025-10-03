#!/bin/bash

set -euo pipefail

PROM_VERSION="2.55.1"
NODE_EXPORTER_VERSION="1.9.0"
USER="prometheus"
GROUP="prometheus"

PROM_SRV="192.168.178.101"
GRAF_SRV="192.168.178.100"
PORTS=(9090 9100)

create_hosts_file() {
    echo -e "\n[+] Generating hosts file for DNS resolution..."
    echo "" >> /etc/hosts
    echo "$PROM_SRV     dev-prom01.fritz.box  dev-prometheus01" >> /etc/hosts
    echo "$GRAF_SRV     dev-grafana02.fritz.box  dev-grafana01" >> /etc/hosts
}

install_prometheus() {
    echo "[+] Creating user and group..."
    id -u $USER &>/dev/null || useradd --no-create-home --shell /bin/false $USER
    getent group $GROUP &>/dev/null || groupadd $GROUP

    echo "[+] Downloading Prometheus ${PROM_VERSION}..."
    cd /opt
    curl -sLO https://github.com/prometheus/prometheus/releases/download/v${PROM_VERSION}/prometheus-${PROM_VERSION}.linux-amd64.tar.gz
    tar xzf prometheus-${PROM_VERSION}.linux-amd64.tar.gz
    mv prometheus-${PROM_VERSION}.linux-amd64 prometheus
    rm -f prometheus-${PROM_VERSION}.linux-amd64.tar.gz

    echo "[+] Downloading Node Exporter ${NODE_EXPORTER_VERSION}..."
    curl -sLO https://github.com/prometheus/node_exporter/releases/download/v${NODE_EXPORTER_VERSION}/node_exporter-${NODE_EXPORTER_VERSION}.linux-amd64.tar.gz
    tar xzf node_exporter-${NODE_EXPORTER_VERSION}.linux-amd64.tar.gz
    mv node_exporter-${NODE_EXPORTER_VERSION}.linux-amd64 node_exporter
    rm -f node_exporter-${NODE_EXPORTER_VERSION}.linux-amd64.tar.gz

    echo "[+] Setting permissions..."
    chown -R $USER:$GROUP /opt/prometheus /opt/node_exporter

    echo "[+] Creating Prometheus config..."
    mkdir -p /etc/prometheus
    cp /opt/prometheus/prometheus.yml /etc/prometheus/
    chown -R $USER:$GROUP /etc/prometheus

    echo "[+] Creating systemd unit files..."
    cat <<EOF > /etc/systemd/system/prometheus.service
[Unit]
Description=Prometheus
Wants=network-online.target
After=network-online.target

[Service]
User=prometheus
Group=prometheus
Type=simple
ExecStart=/opt/prometheus/prometheus \\
  --config.file=/etc/prometheus/prometheus.yml \\
  --storage.tsdb.path=/opt/prometheus/data

[Install]
WantedBy=multi-user.target
EOF

    cat <<EOF > /etc/systemd/system/node_exporter.service
[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=prometheus
Group=prometheus
Type=simple
ExecStart=/opt/node_exporter/node_exporter

[Install]
WantedBy=multi-user.target
EOF

    echo "[+] Enabling and starting services..."
    systemctl daemon-reexec
    systemctl daemon-reload
    systemctl enable --now prometheus
    systemctl enable --now node_exporter
}

# Run
install_prometheus
create_hosts_file
