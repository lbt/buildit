#!/bin/bash
set -eu

tmp="$( mktemp )"
cleanup()
{
    rm -f "${tmp}"
}
trap cleanup EXIT

systemctl start obsrepserver
systemctl start obssrcserver
systemctl start mysql

mysql --defaults-file=<<< "
[mysql]
user = root
password = ''
" <<< "
    UPDATE mysql.user SET Password='*973004CBB77C6F6BA1BF66B1C47DD02CC91A167D' WHERE User='root';
    DELETE FROM mysql.user WHERE User='';
    DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
    DROP DATABASE IF EXISTS test;
    DELETE FROM mysql.db WHERE Db='test' OR Db='test_%';
    CREATE DATABASE api_production;
    CREATE USER 'obs'@'%';
    CREATE USER 'obs'@'localhost';
    UPDATE mysql.user SET Password='*973004CBB77C6F6BA1BF66B1C47DD02CC91A167D' WHERE User='obs';
    GRANT all privileges ON api_production.* TO 'obs'@'%';
    GRANT all privileges ON api_production.* TO 'obs'@'localhost';
    FLUSH PRIVILEGES;
"
