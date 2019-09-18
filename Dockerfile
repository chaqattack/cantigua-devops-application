FROM node:8.11-alpine

WORKDIR /app

ENV DEVOPS_TEST_BACKEND_NAME='devops-test-backend'
ENV DEVOPS_TEST_ENV='development'
ENV DEVOPS_TEST_PORT="3081"
ENV DEVOPS_TEST_RELEASE_VERSION='0.1.0'

COPY package.json .

RUN npm install

COPY . .

RUN chmod +x wait.sh
