#!/bin/bash
set -e
source /build/buildconfig
set -x

$minimal_apt_get_install php5-fpm php5-mysql

mkdir /etc/service/php-fpm
cp /build/php-fpm/php-fpm.runit /etc/service/php-fpm/run

sed 's|listen = /var/run/php5-fpm.sock|listen = 127.0.0.1:9000|' -i /etc/php5/fpm/pool.d/www.conf 
sed 's|post_max_size = 8M|post_max_size = 16M|' -i /etc/php5/fpm/php.ini
sed 's|max_execution_time = 30|max_execution_time = 300|' -i /etc/php5/fpm/php.ini
sed 's|max_execution_time = 30|max_execution_time = 300|' -i /etc/php5/fpm/php.ini
sed 's|max_input_time = 60|max_input_time = 300|' -i /etc/php5/fpm/php.ini
sed 's|;date.timezone =|date.timezone = UTC|' -i /etc/php5/fpm/php.ini
