# Yamdb API
## Описание

**YAMDB** собирает отзывы пользователей на произведения, делящиеся на произовльные категории и жанры, которые можно добавлять самостоятельно.
Проект собран из репозитория [andyi95/api_yamdb](https://github.com/andyi95/api_yamdb) с добавлением поддержки Docker и Docker Compose. При создании использовался следущующий стек технологий: Python3, Django Rest Framework, PostgreSQL, Gunicorn, Docker

## Сборка и запуск проекта

#### 1. Установка Docker и Docker-compose

 Если у вас уже установлены docker и docker-compose, этот шаг можно пропустить, иначе можно воспользоваться официальной [инструкцией](https://docs.docker.com/engine/install/).
 
#### 2. Установка и запуск контейнеров

Внимание! Убедитесь, что на хост-машине не запущены серверы PostGreSQL и/или веб-сервисы, в ином случае перед развёртыванием ознакомьтесь с документацией Docker по сопоставлению портов (port mapping).
В файле .env содержатся основные параметры развёртывания - в целях безопасности рекомендуется заменить поля с секретным ключом Django, именем пользователя и паролем PostgreSQL (SECRET_KEY, POSTGRES_USER и POSTGRES_PASSWORD) на свои. Более подробно с рекомендациями по развертыванию Django можно ознакомиться по [ссылке](https://docs.djangoproject.com/en/3.2/howto/deployment/checklist/).
```bash
git clone https://github.com/andyi95/infra_sp2
docker-compose up -d --build
docker-compose exec web python manage.py makemigrations api
docker-compose exec web python manage.py migrate
docker-compose exec web python manage.py collectstatic --no-input  
```

#### 3. Использование и администрирование

После установки и запуска контейнеров вы можете ознакомиться с документацией по следующему URL: http://localhost/redoc/ (localhost замените на адрес удаленного сервера, на котором происходила установка).

Панель администрирования доступна по адресу http://localhost/admin/

##### Создание суперпользователя:

```bash
docker-compose exec -it web python manage.py createsuperuser
```
##### Заполнение БД тестовым набором данных

```bash
docker exec web python manage.py loaddata fixtures.json
```

##### Остановка и удаление контейнеров

```bash
docker-compose down
docker system prune
```


## Авторы

Также над проектом работали: 
 - [Dkobachevski](https://github.com/dmarichuk)
 - [dmarichuk](https://github.com/dmarichuk)
