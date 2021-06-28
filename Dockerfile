FROM python:3.8.5-slim

LABEL author="andyi95"
LABEL maintainer="Andrey Chernikov"
LABEL release-date="2021-06-28"

RUN set -ex \
    && BUILD_DEPS=" \
    build-essential \
    libpcre3-dev \
    libpq-dev \
    " \
    && apt-get update && apt-get install -y --no-install-recommends $BUILD_DEPS \
    && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false $BUILD_DEPS \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /code
COPY requirements.txt /code

RUN pip install --upgrade pip && pip install -r /code/requirements.txt

COPY . /code

WORKDIR /code

CMD gunicorn api_yamdb.wsgi:application --bind 0.0.0.0:8000
