#!/bin/bash
cp /tmp/puma.service /etc/systemd/system
apt-get update
sleep 20
apt-get -y install git
sleep 20
cd /home/ubuntu
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
sleep 30
systemctl daemon-reload
systemctl enable puma.service
