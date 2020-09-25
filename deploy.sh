#!/bin/bash

docker-compose -f docker-compose-vimagick.yml up -d

sudo iptables -I INPUT -p tcp --dport 1723 -m state --state NEW -j ACCEPT
sudo iptables -I INPUT -p gre -j ACCEPT
sudo iptables -t nat -I POSTROUTING -o eno1 -j MASQUERADE # Replace “eno1″ with the interface connecting to the internet on your VPN server. Use 'ifconfig' or 'ip a' command
sudo iptables -I FORWARD -p tcp --tcp-flags SYN,RST SYN -s 192.168.127.0/24 -j TCPMSS --clamp-mss-to-pmtu # Replace “192.168.127.0/24″ with the remoteip from "pptpd.conf"
sudo iptables -P FORWARD ACCEPT
sudo iptables -P OUTPUT ACCEPT
#sudo iptables-save
