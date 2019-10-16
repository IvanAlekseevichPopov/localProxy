#!/bin/sh
set -e

function updateGateway() {
    sleep 1 #Network not available on startup
    #TODO add ip validation
    : ${VPN_IP:=`getent hosts vpn | awk '{print $1}'`}

    echo ${VPN_IP}

    ip route del default
    ip route add default via ${VPN_IP}
}

updateGateway &

exec "$@"
