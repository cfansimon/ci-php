FROM debian:8.6

MAINTAINER Simon Wood <wq@wuqian.me>

RUN apt-get update
COPY debian/dotdeb.list /etc/apt/sources.list.d
RUN apt-get install -y curl \
    && curl -O https://www.dotdeb.org/dotdeb.gpg \
    && apt-key add dotdeb.gpg \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y php7.0-cli php7.0-curl php7.0-mcrypt php7.0-mysqlnd php7.0-gd php7.0-dom \
    && curl -o /usr/local/bin/phpunit https://phar.phpunit.de/phpunit-5.7.phar \
    && chmod +x /usr/local/bin/phpunit