# Denvpy

A containerized streamlined environment for Python development.

## Requirements

Docker ~= 28.x

## Build

```shell
./build.sh
```

## Run

```shell
docker run -it --rm \
    --network host \
    --env PROJECT_NAME=changeme \
    --env PYTHON_VERSION=3.12 \
    -v /tmp:/app/ws \
    denvpy:local
```
