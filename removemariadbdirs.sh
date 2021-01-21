#!/bin/bash 

if [ `whoami` != root ]; then
    echo Please run this script as root or using sudo
    exit
fi
systemctl stop mariadb 

rm -rfv /data/mariadb
rm -rfv /data/mariadb-binlogs
rm -rfv /data/mariadb-tmp
rm -rfv /var/log/mariadb

semanage fcontext -d "/data/mariadb(/.*)?"
semanage fcontext -d "/data/mariadb/mariadb\.sock"
semanage fcontext -d "/data/mariadb-binlogs(/.*)?"
semanage fcontext -d "/data/mariadb-tmp(/.*)?"
#semanage fcontext -d "/var/log/mariadb(/.*)?"
semanage port -d -t mysqld_port_t -p tcp 3307

#chown -R mysql: /data/mariadb
#chown -R mysql: /data/mariadb-binlogs
#chown -R mysql: /var/log/mariadb
