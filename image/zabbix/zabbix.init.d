#!/bin/bash

###
# Database
###

DB_HOST=${DB_HOST:-}
DB_PORT=${DB_PORT:-}
DB_NAME=${DB_NAME:-}
DB_USER=${DB_USER:-}
DB_PASS=${DB_PASS:-}
DB_TYPE=${DB_TYPE:-}

# MySQL
if [ -n "${MYSQL_PORT_3306_TCP_ADDR}" ]; then
  DB_TYPE=MYSQL
  DB_HOST=${DB_HOST:-${MYSQL_PORT_3306_TCP_ADDR}}
  DB_PORT=${DB_PORT:-${MYSQL_PORT_3306_TCP_PORT}}

  DB_USER=${DB_USER:-${MYSQL_ENV_MYSQL_USER}}
  DB_PASS=${DB_PASS:-${MYSQL_ENV_MYSQL_PASSWORD}}
  DB_NAME=${DB_NAME:-${MYSQL_ENV_MYSQL_DATABASE}}
fi

# Postgres
if [ -n "${POSTGRES_PORT_5432_TCP_ADDR}" ]; then
  DB_TYPE=POSTGRESQL
  DB_HOST=${DB_HOST:-${POSTGRES_PORT_5432_TCP_ADDR}}
  DB_PORT=${DB_PORT:-${POSTGRES_PORT_5432_TCP_PORT}}

  DB_USER=${DB_USER:-${POSTGRES_ENV_POSTGRES_USER}}
  DB_PASS=${DB_PASS:-${POSTGRES_ENV_POSTGRES_PASSWORD}}
  DB_NAME=${DB_NAME:-${POSTGRES_ENV_POSTGRES_USER}}  
fi

if [ -z "${DB_TYPE}" ]; then
  echo "You have to link to a mysql or postgres container, or inform the database type and configuration via environment variables."
  exit 1
fi

sed 's/{{DB_HOST}}/'"${DB_HOST}"'/' -i /etc/zabbix/web/zabbix.conf.php
sed 's/{{DB_PORT}}/'"${DB_PORT}"'/' -i /etc/zabbix/web/zabbix.conf.php
sed 's/{{DB_NAME}}/'"${DB_NAME}"'/' -i /etc/zabbix/web/zabbix.conf.php
sed 's/{{DB_USER}}/'"${DB_USER}"'/' -i /etc/zabbix/web/zabbix.conf.php
sed 's/{{DB_PASS}}/'"${DB_PASS}"'/' -i /etc/zabbix/web/zabbix.conf.php
sed 's/{{DB_TYPE}}/'"${DB_TYPE}"'/' -i /etc/zabbix/web/zabbix.conf.php

###
# Web
###

SERVER_NAME=${SERVER_NAME:-localhost}
sed 's/{{SERVER_NAME}}/'"${SERVER_NAME}"'/' -i /etc/nginx/sites-enabled/zabbix.conf

ZBX_SERVER=${ZBX_SERVER:-}
ZBX_SERVER_PORT=${ZBX_SERVER_PORT:-10051}
ZBX_SERVER_NAME=${ZBX_SERVER_NAME:-zabbix_server}

###
# Zabbix Server
###

if [ -n ${ZBX_PORT_10051_TCP_ADDR} ]; then
  ZBX_SERVER=${ZBX_PORT_10051_TCP_ADDR}
  ZBX_SERVER_PORT=${ZBX_PORT_10051_TCP_PORT}
fi

sed 's/{{ZBX_SERVER}}/'"${ZBX_SERVER}"'/' -i /etc/zabbix/web/zabbix.conf.php
sed 's/{{ZBX_SERVER_PORT}}/'"${ZBX_SERVER_PORT}"'/' -i /etc/zabbix/web/zabbix.conf.php
sed 's/{{ZBX_SERVER_NAME}}/'"${ZBX_SERVER_NAME}"'/' -i /etc/zabbix/web/zabbix.conf.php