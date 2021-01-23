ARG DAPR_VERSION

FROM br1cascio/dapr:${DAPR_VERSION}-node-lts-alpine

RUN mkdir -p /home/node/app/src

ENV DAPR_COMPONENTS_PATH=/home/node/app/components
ENV DAPR_APP_PORT 3000

# install app
WORKDIR /home/node/app/src
COPY src/package*.json ./
RUN npm install
WORKDIR /home/node/app
COPY . .
CMD ["node", "src/app.js"]
