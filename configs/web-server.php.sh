#!/bin/bash

apt-get update
apt-get upgrade -y

# Install php, mcrypt, git, nginx and fail2ban
apt-get install php5
apt-get install php5-apc
apt-get install php5-fpm
apt-get install php5-cli
apt-get install php5-curl
apt-get install php5-json
apt-get install php5-oauth
apt-get install php5-mcrypt
apt-get install php5-mysql
aot-get install php5-memcache
apt-get install mcrypt
apt-get install git
apt-get install nginx
apt-get install fail2ban

# Set our swap space
/bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=1024
/sbin/mkswap /var/swap.1
/sbin/swapon /var/swap.1

# Get composer and make it a global binary
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin
mv /usr/bin/composer.phar /usr/bin/composer

# Set up our web directory with laravel
mkdir /var/www
cd /var/www
composer create-project laravel/laravel .

# PHP Mcrypt fix
touch /etc/php5/fpm/conf.d/20-mcrypt.ini
echo "extension=/usr/lib/php5/20121212/mcrypt.so" >> /etc/php5/fpm/conf.d/20-mcrypt.ini

# Restart php and nginx
service php5-fpm restart
service nginx restart
