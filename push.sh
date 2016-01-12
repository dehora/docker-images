#!/bin/bash

. settings.sh

for SCALA_VERSION in ${SCALA_VERSIONS}; do
    docker push dehora/platform-${SCALA_VERSION}
done
docker push dehora/platform

docker push dehora/zookeeper
docker push dehora/kafka
docker push dehora/schema-registry
docker push dehora/rest-proxy
docker push dehora/tools
