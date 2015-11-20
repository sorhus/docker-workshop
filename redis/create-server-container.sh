#!/bin/bash

docker run -d --name dev-redis-server redis:latest

docker run -v $(pwd)/bootstrap:/bootstrap --link dev-redis-server:redis --rm redis:latest sh -c 'exec cat /bootstrap/cmds | redis-cli -h "$REDIS_PORT_6379_TCP_ADDR" -p "$REDIS_PORT_6379_TCP_PORT"'

