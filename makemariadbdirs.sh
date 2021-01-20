#!/bin/bash 

if [ `whoami` != root ]; then
    echo Please run this script as root or using sudo
    exit
fi

systemctl stop mariadb

mkdir -p /data/mariadb
mkdir -p /data/mariadb-binlogs
mkdir -p /data/mariadb-tmp
mkdir -p /var/log/mariadb

chown -Rv mysql: /data/mariadb
chown -Rv mysql: /data/mariadb-binlogs
chown -Rv mysql: /data/mariadb-tmp
chown -Rv mysql: /var/log/mariadb


semanage fcontext -a -t mysqld_db_t      "/data/mariadb(/.*)?"
semanage fcontext -a -t mysqld_var_run_t "/data/mariadb/mariadb\.sock"
semanage fcontext -a -t mysqld_db_t      "/data/mariadb-binlogs(/.*)?"
semanage fcontext -a -t mysqld_tmp_t     "/data/mariadb-tmp(/.*)?"
#semanage fcontext -a -t mysqld_log_t "/var/log/mariadb(/.*)?"

restorecon -Rv /data/mariadb
restorecon -Rv /data/mariadb-binlogs
restorecon -Rv /data/mariadb-tmp
restorecon -Rv /var/log/mariadb

