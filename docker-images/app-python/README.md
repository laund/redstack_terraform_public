# hello-python

Dependencies:

* Python 3

Install the requirements:

```bash
pip install -r requirements.txt
```

Configure the application:

```bash
export RABBITMQ_HOST = [ rabbitmq host address ]
export RABBITMQ_PORT = [ rabbitmq port ]
export RABBITMQ_QUEUE = hello
```

Build Image:

```bash
docker bulid -t [ name app ]
```

Run the app localy:

```bash
python app.py
```
