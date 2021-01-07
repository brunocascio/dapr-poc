FROM node:lts-alpine

WORKDIR /app

COPY package*.json ./

RUN npm ci

COPY index.js .

CMD npx nodemon index.js

USER node

EXPOSE 3000