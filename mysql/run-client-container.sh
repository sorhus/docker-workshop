#!/bin/bash

docker run -it --link dev-mysql-server:mysql --rm mysql sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -ppass my_app'
