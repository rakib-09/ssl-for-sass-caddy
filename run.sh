#!/usr/bin/env bash
apt install -y vim tree sudo zip unzip sqlite members libcap2-bin
curl https://getcaddy.com | bash -s personal http.cache,http.cors,http.expires,http.geoip,http.git,http.ipfilter,http.locale,http.nobots,http.ratelimit,http.realip
sudo useradd -M -s /bin/false caddy
sudo mkdir -p /etc/caddy
sudo mkdir -p /var/log/caddy
sudo chown -R caddy:root /etc/caddy /var/log/caddy
sudo setcap cap_net_bind_service=+ep /usr/local/bin/caddy
sudo cp Caddyfile /etc/caddy/Caddyfile
sudo cp caddy.service /etc/systemd/system/caddy.service
sudo systemctl daemon-reload
sudo systemctl start caddy
sudo systemctl status caddy
sudo systemctl enable caddy