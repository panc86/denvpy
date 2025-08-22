FROM debian:bookworm-slim
ARG USER=denver
RUN groupadd -g 1000 $USER \
    && useradd -m -d /app -g $USER -u 1000 $USER

# setup workspace
ENV UV_COMPILE_BYTECODE=1 UV_LINK_MODE=copy UV_INSTALL_DIR="/usr/bin"
WORKDIR /app
# install dependencies
RUN apt update \
    && apt install -y wget \
    && wget -qO- https://astral.sh/uv/install.sh | sh \
    && rm -rf /var/lib/apt/lists/*
USER $USER
COPY --chmod=u+x init.sh .
ENTRYPOINT [ "./init.sh" ]
