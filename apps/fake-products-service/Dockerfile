FROM br1cascio/dapr:master-node-14

WORKDIR /home/dapr/app

COPY package*.json ./

RUN npm ci

COPY index.js .

CMD npx nodemon index.js