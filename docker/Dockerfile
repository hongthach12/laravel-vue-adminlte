FROM php:7.4-fpm

RUN apt-get update && apt-get install -y \
        libzip-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        libicu-dev \
        libpq-dev \
        libxpm-dev \
        libvpx-dev \
        libcurl4-openssl-dev \
        libssl-dev \
        pkg-config \
        gcc g++ make autoconf libc-dev pkg-config \
        zlib1g-dev \
    && docker-php-ext-install -j$(nproc) intl \
    && docker-php-ext-install -j$(nproc) zip \
    && docker-php-ext-install -j$(nproc) mysqli \
    && docker-php-ext-install -j$(nproc) pdo_mysql \
    && docker-php-ext-install -j$(nproc) exif \
    && docker-php-ext-configure gd \
        --with-freetype=/usr/include/ \
        --with-jpeg=/usr/include/ \
        --with-xpm=/usr/lib/x86_64-linux-gnu/ \
    && docker-php-ext-install -j$(nproc) gd

RUN apt-get update && apt-get -y install fontconfig libxext6 libxrender1 xfonts-utils \
     libfontenc1 x11-common xfonts-75dpi xfonts-base \
     fonts-wqy-microhei ttf-wqy-microhei fonts-wqy-zenhei ttf-wqy-zenhei \
     ghostscript \
 && curl -L -o /tmp/wkhtmltopdf.deb https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.stretch_amd64.deb \
 && dpkg -i --force-depends /tmp/wkhtmltopdf.deb \
 && fc-cache -f -v

WORKDIR /src

