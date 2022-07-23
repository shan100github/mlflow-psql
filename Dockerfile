FROM python:3.9-bullseye

RUN pip install --no-cache-dir mlflow boto3 && \
    pip install psycopg2==2.9