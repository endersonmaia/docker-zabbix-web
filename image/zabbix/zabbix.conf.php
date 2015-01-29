<?php
// Zabbix GUI configuration file
global $DB;

$DB['TYPE']     = '{{DB_TYPE}}';
$DB['SERVER']   = '{{DB_HOST}}';
$DB['PORT']     = '{{DB_PORT}}';
$DB['DATABASE'] = '{{DB_NAME}}';
$DB['USER']     = '{{DB_USER}}';
$DB['PASSWORD'] = '{{DB_PASS}}';

// SCHEMA is relevant only for IBM_DB2 database
$DB['SCHEMA'] = '';

$ZBX_SERVER      = '{{ZBX_HOST}}';
$ZBX_SERVER_PORT = '{{ZBX_PORT}}';
$ZBX_SERVER_NAME = '{{ZBX_NAME}}';

$IMAGE_FORMAT_DEFAULT = IMAGE_FORMAT_PNG;
?>
