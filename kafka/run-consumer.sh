#!/bin/bash

docker run -it --link dev-kafka:kafka --rm spotify/kafka sh -c "exec /opt/kafka_2.11-0.8.2.1/bin/kafka-console-consumer.sh --zookeeper \$KAFKA_PORT_2181_TCP_ADDR:2181 --from-beginning --topic $1"

