FROM node:6-alpine

COPY . /app

WORKDIR /app

RUN npm install --save amqplib

CMD ["node", "app.js"]
