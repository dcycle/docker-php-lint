#!/bin/bash
#
# Build script to create the Docker image.
#
set -e

curl -sS https://getcomposer.org/installer | php && \
  mv composer.phar /usr/local/bin/composer

echo "Must go through hoops to avoid the dreaded 'dpkg: error processing package libc-bin (--configure)' error. See https://github.com/dcycle/prepare-docker-buildx/blob/master/example/Dockerfile"
apt-get update && \
  apt-get install -y libc-bin && \
  apt-get update && \
  apt-get install -y --no-install-recommends mariadb-client git unzip || true && \
  dpkg --purge --force-all libc-bin && \
  apt-get install -y --no-install-recommends mariadb-client git unzip && \
  rm -rf /var/lib/apt/lists/*

composer global require \
  drupal/coder:8.3.13

/root/.composer/vendor/bin/phpcs --config-set installed_paths ~/.composer/vendor/drupal/coder/coder_sniffer
