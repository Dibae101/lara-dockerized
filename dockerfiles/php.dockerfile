FROM php:8.0-fpm-alpine

WORKDIR /var/www/html

COPY src .

RUN docker-php-ext-install pdo pdo_mysql

RUN chown -R www-data:www-data /var/www/html/storage

RUN chmod -R 775 /var/www/html/storage

RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel

USER laravel
