# Базовый образ для веб-сервера
FROM nginx:latest

# Метаданные об авторе и контактах
MAINTAINER Akhmetov Fannur <thereisnoprogrammer@gmail.com>

# Обновление списка пакетов и установка необходимых
RUN apt-get update && apt-get install -y postgresql postgresql-contrib nginx-extras

# Копирование конфигурационных файлов Nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Копирование конфигурационных файлов PostgreSQL
COPY pg_hba.conf /etc/postgresql/12/main/pg_hba.conf

# Установка рабочей директории
WORKDIR /usr/share/nginx/html

# Установка переменных окружения
ENV POSTGRES_PASSWORD=postgres_password

# Добавление файлов в контейнер
ADD index.html /usr/share/nginx/html/index.html

# Создание папки для хранения данных БД
VOLUME /var/lib/postgresql/12/main

# Установка пользователя
USER nginx

# Открытие портов
EXPOSE 80 5432

# Запускаем PostgreSQL и Nginx при старте контейнера
CMD ["postgres", "-D", "/var/lib/postgresql/12/main", "&&", "nginx", "-g", "daemon off;"]