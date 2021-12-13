#!/bin/bash
#
# Build script to create the Docker image.
#
set -e

curl -sS https://getcomposer.org/installer | php && \
  mv composer.phar /usr/local/bin/composer

apt-get -y update
apt-get --no-install-recommends -y install git unzip
rm -rf /var/lib/apt/lists/*

composer global require \
  squizlabs/php_codesniffer \
  drupal/coder

/root/.composer/vendor/bin/phpcs --config-set installed_paths ~/.composer/vendor/drupal/coder/coder_sniffer
