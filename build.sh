#!/bin/bash
set -e

CWD=$(cd $(dirname $0); pwd)
RELEASE="${1:-local}"
IMAGE="denvpy:${RELEASE}"
echo Building $IMAGE
docker build \
    --force-rm \
    --rm=true \
    -f "$CWD/Dockerfile" \
    --platform linux/amd64 \
    -t $IMAGE \
    $CWD
