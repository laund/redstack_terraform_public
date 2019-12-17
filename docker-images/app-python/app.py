from flask import Flask, request, jsonify

import os

import pika

app = Flask(__name__)

host = os.getenv("RABBITMQ_HOST", "10.5.0.21")
port = os.getenv("RABBITMQ_PORT", 5672)
queue = os.getenv("RABBITMQ_QUEUE", "hello")


html = """
<br>Add your phone <i>number</i> flavour:
<br><form method='POST' action=''>
    <input type='text' name='flavour'>
    <input type='submit'>
    </form>
"""


@app.route('/', methods=['GET'])
def index():
    return html


@app.route('/', methods=['POST'])
def post():
    enqueue(request.form.get("flavour"))
    return html


@app.route('/health', methods=['GET'])
def health():
    return jsonify({"status": "ok"})


def enqueue(value):
    app.logger.info("Received message: %s", value)
    params = pika.ConnectionParameters(host=host, port=port)
    connection = pika.BlockingConnection(params)
    channel = connection.channel()
    channel.queue_declare(queue=queue)
    channel.basic_publish(exchange='', routing_key=queue, body=value)
    connection.close()
    app.logger.info("Enqueued message on host %s:%s queue %s: %s", host, port,
                    queue, value)


if __name__ == "__main__":
    app.run(debug=True, host="10.5.0.35", port=8000)
