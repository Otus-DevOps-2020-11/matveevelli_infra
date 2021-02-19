#!/usr/bin/env bash
cd /opt
apt install git -y
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
cp /tmp/puma.service /etc/systemd/system/puma.service
systemctl daemon-reload
systemctl start puma
systemctl enable puma
systemctl status puma
