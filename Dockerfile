FROM node:8.11-alpine

WORKDIR /app

COPY package.json .

RUN npm install

COPY . /app

RUN chmod +x wait.sh