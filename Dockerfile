FROM python:3.7.0-slim-stretch
ENV PYTHONUNBUFFERED 1
WORKDIR /app

COPY ./django/requirements.txt ./django/requirements-dev.txt /app/

RUN pip install -U pip --no-cache-dir && \
    pip install -r requirements.txt -r requirements-dev.txt --no-cache-dir

COPY ./django /app

ENTRYPOINT ["/bin/bash", "/app/docker-entrypoint.sh"]
