#!/usr/bin/env node
var amqp = require("amqplib/callback_api");

var RABBITMQ_HOST = process.env.RABBITMQ_HOST || "10.5.0.21";
var RABBITMQ_PORT = process.env.RABBITMQ_PORT || 5672;
var RABBITMQ_QUEUE = process.env.RABBITMQ_QUEUE || "hello";

console.log(
  "Connecting to RabbitMQ at %s port %s...",
  RABBITMQ_HOST,
  RABBITMQ_PORT
);

var url = "amqp://" + RABBITMQ_HOST + ":" + RABBITMQ_PORT;
amqp.connect(url, function(err, conn) {

  conn.createChannel(
    function(err, ch) {
      if (err) throw err;

      ch.assertQueue(RABBITMQ_QUEUE, { durable: false });
      console.log("Consuming queue: %s", RABBITMQ_QUEUE);

      ch.consume(RABBITMQ_QUEUE, function(msg) {

      var data =  console.log("Received message: %s", msg);

      });
      },
    { noAck: true }
  );
});
