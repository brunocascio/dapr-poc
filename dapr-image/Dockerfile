ARG NODE_VERSION

FROM node:${NODE_VERSION} as dapr-node

USER root

RUN apk --no-cache add bash curl

RUN curl -s https://raw.githubusercontent.com/dapr/cli/master/install/install.sh | bash -

USER node

# RUN dapr init --slim

COPY --chown=node:node entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]