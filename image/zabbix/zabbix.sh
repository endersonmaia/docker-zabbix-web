#!/bin/bash
set -e
source /build/buildconfig
set -x

curl -O http://repo.zabbix.com/zabbix/2.4/ubuntu/pool/main/z/zabbix-release/zabbix-release_2.4-1+trusty_all.deb
dpkg -i zabbix-release_2.4-1+trusty_all.deb
apt-get update
$minimal_apt_get_install zabbix-frontend-php mysql-client

cp /build/zabbix/zabbix.conf.php /etc/zabbix/web/zabbix.conf.php
cp /build/zabbix/zabbix.init.d /etc/my_init.d/00-zabbix.sh