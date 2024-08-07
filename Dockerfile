
FROM php:7.4
RUN apt-get update -yqq
RUN apt-get install -yqq git libmcrypt-dev libpq-dev libcurl4-gnutls-dev libicu-dev libvpx-dev libjpeg-dev libpng-dev libxpm-dev zlib1g-dev libfreetype6-dev libxml2-dev libexpat1-dev libbz2-dev libgmp3-dev libldap2-dev unixodbc-dev libsqlite3-dev libaspell-dev libsnmp-dev libpcre3-dev libtidy-dev unzip
RUN apt-get install -yqq libzip-dev
RUN apt-get install -yqq libonig-dev
RUN docker-php-ext-install gmp bcmath zip pdo_mysql mbstring curl json intl gd xml bz2 opcache
RUN pecl install xdebug-3.1.6
RUN docker-php-ext-enable xdebug
RUN curl -sS https://getcomposer.org/installer | php
RUN chmod +x composer.phar
RUN mv /composer.phar /usr/bin/composer.phar
RUN ln /usr/bin/composer.phar /usr/bin/composer
RUN apt-get install -yqq python
RUN adduser --disabled-password -gecos "" application
RUN apt-get update -yqq && apt-get -y install screen netcat default-mysql-client
# Install the PECL HTTP extension
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libnghttp2-dev \
    pkg-config \
    && docker-php-ext-install curl
RUN pecl install raphf-2.0.1 propro-2.0.1
RUN docker-php-ext-enable raphf propro
RUN pecl install pecl_http-3.2.4
RUN docker-php-ext-enable http

