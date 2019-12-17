FROM python:3-alpine

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

CMD ["python","app.py"]

EXPOSE 8000
