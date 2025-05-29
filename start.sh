#!/bin/bash
set -e

PROJ_PATH="${1:?ARG 1 (PROJ_PATH) is required}"
PROJ_NAME="${PROJ_PATH##*/}"

echo "Starting $PROJ_NAME in $PROJ_PATH..."
mkdir -p $PROJ_PATH

docker run --rm -it \
    --name $PROJ_NAME \
    --network host \
    -v ${PROJ_PATH}:/data/${PROJ_NAME} \
    denv:v1
