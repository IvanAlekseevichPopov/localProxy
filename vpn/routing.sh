#!/bin/sh

: ${TUN_LOCAL_IP:=`ip -o addr show tun0 | awk '{print $4}'`}
: ${LOCAL_SUBNET:=`ip -o addr show eth0 | awk '{print $4}'`}

iptables -t nat -A POSTROUTING ! -d ${LOCAL_SUBNET} -o tun0 -j SNAT --to-source ${TUN_LOCAL_IP}
