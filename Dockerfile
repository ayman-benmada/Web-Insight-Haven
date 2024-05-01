ARG PHP_EXTENSIONS="pdo_mysql gd ldap zip xdebug"
ARG NODE_VERSION="20"
ARG INSTALL_CRON=1

FROM thecodingmachine/php:8.3-v4-slim-apache as base

WORKDIR /app

ENV APACHE_EXTENSIONS_HTTP2 1
ENV APACHE_DOCUMENT_ROOT /app/public
ENV PHP_MEMORY_LIMIT "512M"
ENV PHP_INI_UPLOAD_MAX_FILESIZE "10M"
ENV PHP_INI_POST_MAX_SIZE "15M"

USER root

ADD --chown=docker:docker ./ /app

RUN <<EOR
apt-get update -y && \
apt-get install -y zip unzip && \
rm -rf /var/lib/apt

composer install --no-dev --no-scripts

npm install
npm run production
EOR

USER docker
