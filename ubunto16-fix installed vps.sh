#!/bin/bash
#
# 
# ==================================================

MYIP=$(wget -qO- ipv4.icanhazip.com);
: '
# check registered ip
if ! grep -w -q $MYIP daftarip; then
	echo "Sorry, only registered IPs can use this script!"
	if [[ $vps = "vps" ]]; then
		echo "Powered by Team-Archie"
	else
		echo "Powered by Team-Archie"
	fi
	rm -f /root/daftarip
	exit
fi
'
# initialisasi var
export DEBIAN_FRONTEND=noninteractive
OS=`uname -m`;
MYIP=$(wget -qO- ipv4.icanhazip.com);
MYIP2="s/xxxxxxxxx/$MYIP/g";

#detail nama perusahaan
country=ID
state=Manila
locality=Manila
organization=SquadronVPN
organizationalunit=IT
commonname=SquadronVPN.com
email=SquadronVPN@gmail.com

#
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -t nat -A POSTROUTING -s 10.8.0.0/16 -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.8.0.0/16 -j SNAT --to $MYIP
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -s 10.8.0.0/16 -j ACCEPT
iptables -A FORWARD -j REJECT
iptables -A INPUT -p tcp --dport 25 -j DROP
iptables -A INPUT -p udp --dport 25 -j DROP
#

# install neofetch
echo 'Installation Complete you can now close the terminal window and exit the app!';
echo '#############################################
#      UBUNTO 16 Setup OpenVPN/SSH/SSL      #
#         Authentication file system        #
#       Setup by: ARCHIE BONA               #
#       Server System: Digital-Network      #
#############################################';
cd
rm ~/*