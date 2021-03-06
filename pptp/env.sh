#!/usr/bin/env bash

SYSCTLCONFIG=/etc/sysctl.conf
PPTPDCONFIG=/etc/pptpd.conf
PPTPOPTIONS=/etc/ppp/options.pptp
CHAPSECRETS=/etc/ppp/chap-secrets
IPTABLES=/etc/iptables.rules
CHECKSERVER=/etc/ppp/checkserver.sh

LOCALPREFIX="172.16"
LOCALIP="$LOCALPREFIX.0.0"
LOCALMASK="/24"

LOCALIPMASK="$LOCALIP$LOCALMASK"

IP=$(ip addr | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1)
if [[ "$IP" = "" ]]; then
	IP=$(wget -4qO- "http://whatismyip.akamai.com/")
fi
