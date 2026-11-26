#!/bin/bash
#
# Build script to create the Docker image.
#
set -e

# Install Composer.
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

# Install system dependencies.
apt-get update

apt-get install -y --no-install-recommends \
  mariadb-client \
  git \
  unzip \
  libonig-dev

# Install PHP extensions.
docker-php-ext-install mbstring

# Clean up apt cache.
rm -rf /var/lib/apt/lists/*

# Copy Composer configuration.
cp /docker-resources/composer.json /

# Install dependencies.
cd /
composer install --no-interaction --prefer-dist

# Verify installation.
composer show drupal/coder
composer show squizlabs/php_codesniffer

vendor/bin/phpcs -i
