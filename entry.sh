#!/bin/bash
mkdir -p /var/log/redis
chown -R redis:999 /var/lib/redis /tmp /var/log/redis
/usr/local/bin/redis-server /etc/redis/redis.conf
