#!/bin/bash

docker run -d --name dev-mysql-server -e MYSQL_ROOT_PASSWORD=pass mysql:latest

sleep 10

docker run -it --link dev-mysql-server:mysql --rm mysql sh -c 'exec printf "create database my_app;" | mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -ppass'

address=$(docker run -it --link dev-mysql-server:mysql --rm mysql sh -c 'exec echo "$MYSQL_PORT_3306_TCP_ADDR"')
cd migration
docker run --rm --link dev-mysql-server:mysql -v $(pwd):/flyway/sql shouldbee/flyway -user=root -password=pass -url=jdbc:mysql://$address/my_app migrate

