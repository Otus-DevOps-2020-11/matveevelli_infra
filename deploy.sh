#!/usr/bin/env bash
echo "start deploy"
cd ~
apt-get install -y git
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
puma -d
echo "deploy end"
echo "check http://PUBLIC_IP_ADDRESS:9292"
