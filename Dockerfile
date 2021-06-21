FROM python:3.8.5

LABEL version="1.0"
LABEL author="andyi95"
LABEL maintainer="Andrey Chernikov"
LABEL release-date="2021-06-08"

RUN mkdir /code
COPY requirements.txt /code

RUN pip install --upgrade pip && pip install -r /code/requirements.txt

COPY . /code

WORKDIR /code
# Fixed 'Relation api_user does not exist' error
RUN python manage.py makemigrations api && python manage.py migrate
CMD gunicorn api_yamdb.wsgi:application --bind 0.0.0.0:8000
