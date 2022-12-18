#!/bin/ash
cd /mnt/server
apk --update add git
cd /mnt/server/
git clone https://github.com/louislam/uptime-kuma.git .
git fetch --all
echo -e "Install complete"
exit 0
