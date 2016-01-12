#!/bin/bash

. settings.sh

for SCALA_VERSION in ${SCALA_VERSIONS}; do
    echo "Building dehora-platform-${SCALA_VERSION}"
    cp confluent-platform/Dockerfile confluent-platform/Dockerfile.${SCALA_VERSION}
    sed -i "s/ENV SCALA_VERSION=.*/ENV SCALA_VERSION=\"${SCALA_VERSION}\"/" confluent-platform/Dockerfile.${SCALA_VERSION}
    TAGS="dehora/confluent-platform-${SCALA_VERSION}"
    if [ "x$SCALA_VERSION" = "x$DEFAULT_SCALA_VERSION" ]; then
	TAGS="$TAGS dehora/confluent-platform"
    fi
    for TAG in ${TAGS}; do
	docker build -t $TAG -f confluent-platform/Dockerfile.${SCALA_VERSION} confluent-platform/
    done
done

# docker build -t dehora/confluent-platform confluent-platform/
docker build -t dehora/zookeeper zookeeper/
docker build -t dehora/kafka kafka/
docker build -t dehora/schema-registry schema-registry/
docker build -t dehora/rest-proxy rest-proxy/
docker build -t dehora/tools tools/

