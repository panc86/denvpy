#!/bin/bash
set -e

CWD=$(cd $(dirname $0); pwd)
IMAGE="denv:${1:-v1}"

echo Building $IMAGE
docker build \
    --force-rm \
    --rm=true \
    -f "$CWD/Dockerfile" \
    --platform linux/amd64 \
    --build-arg PYTHON_VERSION=$PYTHON_VERSION \
    -t $IMAGE \
    $CWD
