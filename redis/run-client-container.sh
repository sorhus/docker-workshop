#!/bin/bash

docker run -it --link dev-redis-server:redis --rm redis:latest sh -c 'exec redis-cli -h "$REDIS_PORT_6379_TCP_ADDR" -p "$REDIS_PORT_6379_TCP_PORT"'
