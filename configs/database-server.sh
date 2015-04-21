#!/bin/bash 

apt-get update
apt-get upgrade -y

# Install mysql-server-5.5 and fail2ban
apt-get install mysql-server-5.5
apt-get install fail2ban

# Set our swap space
/bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=1024
/sbin/mkswap /var/swap.1
/sbin/swapon /var/swap.1
