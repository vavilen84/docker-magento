FROM php:7.3-fpm

ENV COMPOSER_HOME "/composer"

ARG MAGENTO_ACCOUNT_USERNAME
ARG MAGENTO_ACCOUNT_PASSWORD

# Copy files
COPY ./src/ ./

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    g++ \
    libxml2-dev \
    jpegoptim optipng pngquant gifsicle \
    vim \
    zlib1g-dev \
    libicu-dev \
    libmcrypt-dev \
    unzip \
    libxslt1-dev \
    sendmail-bin \
    sendmail \
    sudo \
    git \
    libzip-dev \
    curl

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install extensions
#RUN docker-php-ext-configure bcmath
#RUN docker-php-ext-install bcmath
RUN docker-php-ext-install pdo_mysql mbstring zip exif pcntl bcmath soap dom intl xsl zip sockets
RUN docker-php-ext-configure gd --with-gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/
RUN docker-php-ext-install gd

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
COPY ./docker/php/auth.json $COMPOSER_HOME/

RUN  sed -i "s/MAGENTO_ACCOUNT_USERNAME/$MAGENTO_ACCOUNT_USERNAME/g" $COMPOSER_HOME/auth.json
RUN  sed -i "s/MAGENTO_ACCOUNT_PASSWORD/$MAGENTO_ACCOUNT_PASSWORD/g" $COMPOSER_HOME/auth.json

RUN groupadd -g 1000 www
RUN useradd -u 1000 -ms /bin/bash -g www www

# Expose port 9000 and start php-fpm server
EXPOSE 9000

RUN composer update && php-fpm