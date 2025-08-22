#!/bin/bash
set -e

PROJECT_DIR="/app/ws/${PROJECT_NAME?Required}"
mkdir -p $PROJECT_DIR
cd $PROJECT_DIR

if [ ! -f $PROJECT_DIR/pyproject.toml ]; then
    uv init --app --no-cache --python ${PYTHON_VERSION:-3.12}
    uv add notebook
fi
export PATH="$PROJECT_DIR/.venv/bin:$PATH"
bash $@
