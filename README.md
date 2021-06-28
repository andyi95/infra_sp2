# Yamdb API
## Описание

**YAMDB** собирает отзывы пользователей на произведения, делящиеся на произовльные категории и жанры, которые можно добавлять самостоятельно.
Проект собран из репозитория [andyi95/api_yamdb](https://github.com/andyi95/api_yamdb) с добавлением поддержки Docker и Docker Compose.

## Сборка и запуск проекта

#### 1. Установка Docker и Docker-compose

 Если у вас уже установлены docker и docker-compose, этот шаг можно пропустить, иначе можно воспользоваться официальной [инструкцией](https://docs.docker.com/engine/install/).
 
#### 2. Установка и запуск контейнеров

Внимание! Убедитесь, что на хост-машине не запущены серверы PostGreSQL и/или веб-сервисы, в ином случае перед развёртыванием ознакомьтесь с документацией Docker по сопоставлению портов (port mapping)
```bash
git clone https://github.com/andyi95/infra_sp2
docker-compose up -d --build
docker-compose exec web python manage.py makemigrations api
docker-compose exec web python manage.py migrate
docker-compose exec web python manage.py collectstatic --no-input  
```

#### 3. Администрирование

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
```


## Авторы
[andyi95](https://github.com/dmarichuk)
[Dkobachevski](https://github.com/dmarichuk)
[dmarichuk](https://github.com/dmarichuk)

## Технологии в проекте
 - python
 - Django 
 
## Quel-que chose?