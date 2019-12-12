FROM php:7

RUN curl -sS https://getcomposer.org/installer | php && \
  mv composer.phar /usr/local/bin/composer
RUN apt-get -y update && \
  apt-get --no-install-recommends -y install git unzip && \
  rm -rf /var/lib/apt/lists/*
RUN composer global require \
  squizlabs/php_codesniffer \
  drupal/coder
RUN /root/.composer/vendor/bin/phpcs --config-set installed_paths ~/.composer/vendor/drupal/coder/coder_sniffer

ENTRYPOINT [ "/root/.composer/vendor/bin/phpcs" ]
