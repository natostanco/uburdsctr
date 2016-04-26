#!/bin/bash
mkdir -p /var/log/redis /etc/redis/${HOSTNAME} && cp /etc/redis/*.conf /etc/redis/${HOSTNAME} && chown -R redis:999 /var/lib/redis /tmp /var/log/redis && redis-server /etc/redis/${HOSTNAME}/redis.conf
