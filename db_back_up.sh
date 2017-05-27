#!/bin/bash

mysqlName=mysqlName
mysqlFileName=${mysqlName}`date +%Y%m%d`

baseDir=/etc/mysql/backup

sudo mysqldump -uroot -ppassword ${mysqlName} > ${baseDir}/${mysqlFileName}.sql

tar -zcPvf ${baseDir}/${mysqlFileName}.sql.tar.gz ${baseDir}/${mysqlFileName}.sql 

rm -f ${baseDir}/${mysqlFileName}.sql;

find ${baseDir} -mtime +6 -name "${mysqlName}*.tar.gz" -exec rm -rf {} \;
