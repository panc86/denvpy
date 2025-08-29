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
    -v <your-workspace>:/app/ws \
    denvpy:local
```

> you can create new project inside a given directory:
> --env PROJECT_NAME=app/src creates project `src` inside app/

## Commands

Start a Jupyter Notebook

```shell
uvx --python 3.12 --with jupyter jupyter-notebook --notebook-dir=/app/ws
```
