#!/bin/bash
set -e
source /build/buildconfig
set -x

add-apt-repository -y ppa:nginx/stable
apt-get update
$minimal_apt_get_install nginx 
echo -e "\ndaemon off;" >> /etc/nginx/nginx.conf
chown -R www-data:www-data /var/lib/nginx

rm /etc/nginx/sites-enabled/default
cp /build/nginx/zabbix.nginx.conf /etc/nginx/sites-available/zabbix.conf
ln -s /etc/nginx/sites-available/zabbix.conf /etc/nginx/sites-enabled/zabbix.conf
ln -s /usr/share/zabbix /usr/share/nginx/html/zabbix

mkdir /etc/service/nginx
cp /build/nginx/nginx.runit /etc/service/nginx/run

mkdir /etc/service/nginx-log-forwarder
cp /build/nginx/nginx-log-forwarder.runit /etc/service/nginx-log-forwarder/run
