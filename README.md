Lint PHP projects using [PHP Code Sniffer](https://github.com/squizlabs/PHP_CodeSniffer), including with the Drupal coding standard.

For example:

    docker run -v "$(pwd)":/code dcycle/php-lint --standard=DrupalPractice /code
    docker run -v "$(pwd)":/code dcycle/php-lint --standard=Drupal /code
    docker run -v "$(pwd)":/code dcycle/php-lint /code

You will need to explicitly ignore js files or the Drupal and PHPCS linters will give conflicting information:

    docker run -v "$(pwd)":/code \
      dcycle/php-lint \
      --ignore=data/*,*.js \
      --standard=Drupal \
      --report=full \
      /code

Get help like this:

    docker run -v $(pwd):/code dcycle/php-lint

To ignore certain lines in your PHP files:

    // @codingStandardsIgnoreStart
    ... 
    // @codingStandardsIgnoreEnd

Resources
-----

 * [This image on Docker.io](https://hub.docker.com/r/dcycle/php-lint/)
