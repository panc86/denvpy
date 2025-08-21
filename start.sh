#!/bin/bash
set -e

WSDIR="${HOME}/ws"
mkdir -p ${WSDIR}
IMAGE="denvpy:${PYTHON_VERSION:-3.12-slim}"
echo "$IMAGE -> starting development environment"
docker run --rm -it \
    --name denvpy-ws \
    --network host \
    -v ${WSDIR}:/app/ws \
    $IMAGE \
    $@
