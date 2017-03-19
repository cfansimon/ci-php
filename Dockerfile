FROM hub.c.163.com/library/debian:8.6

MAINTAINER Simon Wood <wq@wuqian.me>

COPY debian/sources.list /etc/apt/sources.list
RUN apt-get update && apt-get install -y curl
COPY debian/dotdeb.list /etc/apt/sources.list.d/dotdeb.list
RUN curl -o /root/dotdeb.gpg https://www.dotdeb.org/dotdeb.gpg && apt-key add /root/dotdeb.gpg \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y php7.0-cli php7.0-curl php7.0-mcrypt php7.0-mysqlnd php7.0-gd php7.0-dom \
    && curl -o /usr/local/bin/phpunit https://phar.phpunit.de/phpunit-5.7.phar && chmod +x /usr/local/bin/phpunit