#
# Dapr base image
#
FROM ubuntu:20.04 as dapr-base

RUN apt update && apt install -y bash curl \
    && rm -rf /var/lib/apt/lists/* \
    && adduser --system --shell /bin/bash dapr

RUN curl -sL https://raw.githubusercontent.com/dapr/cli/master/install/install.sh | bash -

USER dapr

WORKDIR /home/dapr

RUN dapr init --slim

COPY entrypoint.sh ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]

#
# Dapr with nodejs
#
FROM dapr-base as dapr-node

ARG NODE_VERSION

USER root

RUN curl -sL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - \
    && apt install nodejs \
    && rm -rf /var/lib/apt/lists/*

USER dapr