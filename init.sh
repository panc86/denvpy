#!/bin/bash
set -e

PROJECT_DIR="/app/ws/${PROJECT_NAME?Required}"
mkdir -p $PROJECT_DIR
cd $PROJECT_DIR
exec $@
