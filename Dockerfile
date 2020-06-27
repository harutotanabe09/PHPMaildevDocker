FROM php:7.4.7-apache

# 日本語対応
ENV LANG=C.UTF-8
ENV LANGUAGE=en_US

# Node Install 
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - \ 
    && apt-get update \
    && apt-get install -y nodejs

COPY --from=composer /usr/bin/composer /usr/bin/composer
WORKDIR /var/www/html

ADD docker-entrypoint.sh /var/
RUN chmod 777 /var/docker-entrypoint.sh

CMD sh /var/docker-entrypoint.sh
