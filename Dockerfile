FROM debian:8

MAINTAINER Simon Wood <i@wuqian.me>

#COPY debian/sources.list /etc/apt/sources.list
RUN apt-get update && apt-get install -y curl git \
    && apt-get install -y apt-transport-https lsb-release ca-certificates \
    && curl -Lo /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
    && echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list \
    && apt-get update \
    && apt-get install -y php7.1-cli php7.1-curl php7.1-mcrypt php7.1-mysqlnd php7.1-gd php7.1-dom php7.1-xdebug \
    && curl -Lo /usr/local/bin/phpunit https://phar.phpunit.de/phpunit-6.4.4.phar  && chmod +x /usr/local/bin/phpunit \
    && curl -Lo /usr/local/bin/php-cs-fixer http://cs.sensiolabs.org/download/php-cs-fixer-v2.phar && chmod +x /usr/local/bin/php-cs-fixer
