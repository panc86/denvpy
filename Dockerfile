ARG PYTHON_RELEASE=3.12-slim
FROM python:${PYTHON_RELEASE}

# add our user and group first to make sure their IDs get assigned consistently,
# regardless of whatever dependencies get added
RUN set -eux; \
	groupadd -r -g 1000 denver; \
	useradd -r -d /data -g denver -u 1000 denver

# system env
ENV PYTHONUNBUFFERED=1
ENV PIP_NO_CACHE_DIR=off
ENV PIP_DISABLE_PIP_VERSION_CHECK=on
ENV PIP_DEFAULT_TIMEOUT=100
ENV POETRY_HOME=/opt/poetry
ENV POETRY_VIRTUALENVS_IN_PROJECT=true
ENV POETRY_NO_INTERACTION=1
ENV PATH="$POETRY_HOME/bin:$PATH"

# install poetry
RUN apt update; \
    apt install -y --no-install-recommends curl; \
    curl -sSL https://install.python-poetry.org | python3 - 

# setup workspace
VOLUME /data
WORKDIR /data
COPY pyproject.toml .

# setup environment
RUN poetry install --no-cache --compile
ENV PATH="/data/.venv/bin:$PATH"

# setup workspace
RUN chown -R denver:denver /data
USER denver

EXPOSE 8888

ENTRYPOINT [ "bash" ]
