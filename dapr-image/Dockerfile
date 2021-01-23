ARG NODE_VERSION

FROM node:${NODE_VERSION} as dapr-node

ARG DAPR_VERSION

USER root

RUN apk --no-cache add bash curl

RUN curl -s https://raw.githubusercontent.com/dapr/cli/master/install/install.sh | bash -s ${DAPR_VERSION}

USER node

RUN dapr init --slim --runtime-version ${DAPR_VERSION}

COPY --chown=node entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]