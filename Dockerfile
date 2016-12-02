FROM php:7

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN apt-get -y update
RUN apt-get -y install zip
RUN composer global require 'squizlabs/php_codesniffer'
RUN composer global require 'drupal/coder'
RUN /root/.composer/vendor/bin/phpcs --config-set installed_paths ~/.composer/vendor/drupal/coder/coder_sniffer

ENTRYPOINT [ "/root/.composer/vendor/bin/phpcs" ]
