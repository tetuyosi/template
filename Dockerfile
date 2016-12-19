FROM php:7.1-fpm-alpine

ENV TZ JST-9

# PHP
RUN set -ex \
  && docker-php-ext-install opcache \
  && apk add --no-cache --virtual .php-builddeps \
    zlib-dev \
  && docker-php-ext-install zip \
    pdo_mysql \
  && apk del --purge .php-builddeps \
  && curl -sS https://getcomposer.org/installer \
    | php -- --install-dir=/usr/local/bin --filename=composer --version=1.2.0

COPY ./src /var/www/html
WORKDIR /var/www/html

ADD /docker/php/composer-cache.tar.gz /var/www/
RUN set -ex \
  && composer install --no-dev \
  && rm -rf .composer

VOLUME ["/var/www/html"]

CMD ["php-fpm"]
