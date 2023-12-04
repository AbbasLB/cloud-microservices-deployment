FROM python:3.9-slim

COPY requirements.txt /app/requirements.txt
COPY frontend-latency-test.py /app/frontend-latency-test.py

WORKDIR /app

RUN pip install -r requirements.txt
ENTRYPOINT ["python", "/app/frontend-latency-test.py"]

