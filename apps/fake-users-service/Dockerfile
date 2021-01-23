ARG DAPR_VERSION

FROM br1cascio/dapr:${DAPR_VERSION}-node-lts-alpine

RUN mkdir -p /home/node/app

WORKDIR /home/node/app

COPY package*.json ./

RUN npm ci

COPY . .

CMD ["npm", "start"]