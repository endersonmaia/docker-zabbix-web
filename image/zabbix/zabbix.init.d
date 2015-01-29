#!/bin/bash

DB_HOST=${DB_HOST:-}
DB_PORT=${DB_PORT:-3306}
DB_NAME=${DB_NAME:-}
DB_USER=${DB_USER:-}
DB_PASS=${DB_PASS:-}
DB_TYPE=${DB_TYPE:-MYSQL}

ZBX_HOST=${ZBX_HOST:-}
ZBX_PORT=${ZBX_PORT:-10051}
ZBX_NAME=${ZBX_NAME:-zabbix_server}

if [ -n ${ZBX_PORT_10051_TCP_ADDR} ]; then
  ZBX_HOST=${ZBX_PORT_10051_TCP_ADDR}
  ZBX_PORT=${ZBX_PORT_10051_TCP_PORT}
fi

SERVER_NAME=${SERVER_NAME:-localhost}

if [ -n "${MYSQL_PORT_3306_TCP_ADDR}" ]; then
  DB_TYPE=MYSQL
  DB_HOST=${DB_HOST:-${MYSQL_PORT_3306_TCP_ADDR}}
  DB_PORT=${DB_PORT:-${MYSQL_PORT_3306_TCP_PORT}}

  DB_USER=${DB_USER:-${MYSQL_ENV_MYSQL_USER}}
  DB_PASS=${DB_PASS:-${MYSQL_ENV_MYSQL_PASSWORD}}
  DB_NAME=${DB_NAME:-${MYSQL_ENV_MYSQL_DATABASE}}
fi

sed 's/{{DB_HOST}}/'"${DB_HOST}"'/' -i /etc/zabbix/web/zabbix.conf.php
sed 's/{{DB_PORT}}/'"${DB_PORT}"'/' -i /etc/zabbix/web/zabbix.conf.php
sed 's/{{DB_NAME}}/'"${DB_NAME}"'/' -i /etc/zabbix/web/zabbix.conf.php
sed 's/{{DB_USER}}/'"${DB_USER}"'/' -i /etc/zabbix/web/zabbix.conf.php
sed 's/{{DB_PASS}}/'"${DB_PASS}"'/' -i /etc/zabbix/web/zabbix.conf.php
sed 's/{{DB_TYPE}}/'"${DB_TYPE}"'/' -i /etc/zabbix/web/zabbix.conf.php

sed 's/{{SERVER_NAME}}/'"${SERVER_NAME}"'/' -i /etc/nginx/sites-enabled/zabbix.conf

sed 's/{{ZBX_HOST}}/'"${ZBX_HOST}"'/' -i /etc/zabbix/web/zabbix.conf.php
sed 's/{{ZBX_PORT}}/'"${ZBX_PORT}"'/' -i /etc/zabbix/web/zabbix.conf.php
sed 's/{{ZBX_NAME}}/'"${ZBX_NAME}"'/' -i /etc/zabbix/web/zabbix.conf.php