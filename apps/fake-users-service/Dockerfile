FROM br1cascio/dapr:node-14-alpine

RUN mkdir -p /home/node/app

WORKDIR /home/node/app

COPY package*.json ./

RUN npm ci

COPY . .

CMD ["npm", "start"]