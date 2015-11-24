#!/bin/bash

docker run -it --link dev-kafka:kafka --rm spotify/kafka sh -c "exec /opt/kafka_2.11-0.8.2.1/bin/kafka-console-producer.sh --broker-list \$KAFKA_PORT_9092_TCP_ADDR:9092 --topic $1"

