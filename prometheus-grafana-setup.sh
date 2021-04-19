#!/bin/sh 

PROMETHEUS_DOWNLOAD_URL=https://github.com/prometheus/prometheus/releases/download/v2.26.0/prometheus-2.26.0.linux-amd64.tar.gz 
NODE_EXPORTER_DOWNLOAD_URL=https://github.com/prometheus/node_exporter/releases/download/v1.1.2/node_exporter-1.1.2.linux-amd64.tar.gz
GRAFANA_PACKAGE_URL=https://dl.grafana.com/oss/release/grafana_7.5.4_amd64.deb
 
echo 'Install Prometheus and Grafana on localhost.'

echo 'Download Prometheus archive.'
curl -sL $PROMETHEUS_DOWNLOAD_URL > prometheus.tar.gz

echo 'Extract Prometheus archive.'
gunzip prometheus.tar.gz
tar -xf prometheus.tar

echo 'Download Node_Exporter archive.'
curl -sL $NODE_EXPORTER_DOWNLOAD_URL > node_exporter.tar.gz

echo 'Extract Node_Exporter.'
gunzip node_exporter.tar.gz
tar -xf node_exporter.tar

echo 'Install Grafana.'
sudo apt-get install -y adduser libfontconfig1
curl -sL $GRAFANA_PACKAGE_URL > grafana.deb
sudo dpkg -i grafana.deb

echo 'Install Grafana Node_Exporter dashboard.'
sudo cp grafana/node-exporter-dashboard.json  /etc/grafana/provisioning/dashboards/
sudo cp grafana/prometheus-datasource.json /etc/grafana/provisioning/datasources
