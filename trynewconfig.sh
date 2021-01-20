#!/bin/bash 

if [ `whoami` != root ]; then
    echo Please run this script as root or using sudo
    exit
fi

systemctl stop mariadb

if [ -e newmy.cnf ]; then 
    cp newmy.cnf /etc/my.cnf
else
    echo newmy.cnf file not found. 
    exit
fi

systemctl start mariadb
sleep 1

ls -la /data/mariadb
ls -la /data/mariadb-binlogs
ls -la /var/log/mariadb

tail /var/log/mariadb/mariadb.log
