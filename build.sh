#!/bin/bash
set -e

CWD=$(cd $(dirname $0); pwd)
IMAGE="denvpy:${PYTHON_VERSION:-3.12-slim}"
echo Building $IMAGE
docker build \
    --force-rm \
    --rm=true \
    -f "$CWD/Dockerfile" \
    --platform linux/amd64 \
    --build-arg PYTHON_VERSION="${PYTHON_VERSION:-3.12-slim}" \
    -t $IMAGE \
    $CWD
