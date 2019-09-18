FROM node:8.11-alpine

WORKDIR /app

COPY package.json .

RUN npm config set strict-ssl false

RUN npm install

COPY wait /app

RUN chmod +x /app/wait

RUN /app/wait && npm run migrate-up

CMD ["npm", "run", "start"]