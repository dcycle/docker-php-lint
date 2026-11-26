
#!/bin/bash
#
# Build script to create the Docker image.
#
set -e

# Install Composer.
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

# PHP 7 uses the older Debian Bullseye base image.
# Move its security repository to the Debian archive.
if grep -q 'bullseye' /etc/os-release; then
  find /etc/apt -type f \( -name '*.list' -o -name '*.sources' \) \
    -exec sed -i \
    's|deb.debian.org/debian-security|archive.debian.org/debian-security|g' {} +

  echo 'Acquire::Check-Valid-Until "false";' \
    > /etc/apt/apt.conf.d/99no-check-valid-until
fi

# Install dependencies. Do not hide installation errors.
apt-get update
apt-get install -y --no-install-recommends \
  mariadb-client \
  git \
  unzip

# Clean up apt cache.
rm -rf /var/lib/apt/lists/*

# Install Drupal coding standards.
mv /docker-resources/composer.json /

composer install --no-interaction --prefer-dist
