#!/usr/bin/env sh

mkdir -p /dev/net

if [ ! -c /dev/net/tun ]; then
    mknod /dev/net/tun c 10 200
    chmod 600 /dev/net/tun
fi

exec openvpn --cd /root/config --config config.conf
