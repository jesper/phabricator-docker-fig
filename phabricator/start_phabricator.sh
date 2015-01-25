#!/usr/bin/env bash
set -e
service postfix start

cd /opt/phabricator/bin
./storage upgrade --force
./phd start
/usr/sbin/apache2ctl -D FOREGROUND
