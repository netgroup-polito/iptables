#!/bin/bash

set -x

sudo ./iptables -A INPUT -s 10.1.1.1 -j ACCEPT
sudo ./iptables -A FORWARD -d 20.1.1.1 -j DROP
sudo ./iptables -A OUTPUT -s 10.0.0.0/24 -d 20.0.0.0/16 -j ACCEPT

sudo ./iptables -I INPUT -s 10.1.1.1 -j ACCEPT
sudo ./iptables -I INPUT 10 -s 10.1.1.1 -j ACCEPT

sudo ./iptables -D INPUT -s 10.1.1.1 -j ACCEPT

sudo ./iptables -A INPUT -s 10.1.1.1 -d 20.1.1.1/30 --proto tcp --sport 80 --dport=100 --tcp-flags ALL SYN,ACK -j ACCEPT
sudo ./iptables -A INPUT -s 10.1.1.1 -d 20.1.1.1/30 --proto tcp --tcp-flags SYN,ACK ACK -j ACCEPT
sudo ./iptables -A INPUT -s 10.1.1.1 -d 20.1.1.1/30 --proto udp --sport 8080 --dport=8080 -j DROP
