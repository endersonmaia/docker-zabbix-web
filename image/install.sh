#!/bin/bash
set -e
source /build/buildconfig
set -x

# Installing
/build/nginx/nginx.sh
/build/php-fpm/php-fpm.sh
/build/zabbix/zabbix.sh
