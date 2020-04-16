[![CircleCI](https://circleci.com/gh/dcycle/docker-php-lint.svg?style=svg)](https://circleci.com/gh/dcycle/docker-php-lint)

Lint PHP projects using [PHP Code Sniffer](https://github.com/squizlabs/PHP_CodeSniffer), including with the Drupal coding standard.

This image was first created on December 2nd, 2016 and was not updated before Dec. 12, 2019. If you have a project which uses the image from before Dec. 12, 2019, use tag 1. After Dec. 12, 2019, this project will be rebuilt every week using the latest version of the software, and use tag 2.

For example:

    docker run --rm -v "$(pwd)":/code dcycle/php-lint:2 --standard=DrupalPractice /code
    docker run --rm -v "$(pwd)":/code dcycle/php-lint:2 --standard=Drupal /code
    docker run --rm -v "$(pwd)":/code dcycle/php-lint:2 /code

You will need to explicitly ignore js files or the Drupal and PHPCS linters will give conflicting information:

    docker run --rm -v "$(pwd)":/code \
      dcycle/php-lint:2 \
      --ignore=data/*,*.js \
      --standard=Drupal \
      --report=full \
      /code

Get help like this:

    docker run --rm -v $(pwd):/code dcycle/php-lint:2 --help

To ignore certain lines in your PHP files:

    // @codingStandardsIgnoreStart
    ...
    // @codingStandardsIgnoreEnd

Resources
-----

 * [This image on Docker.io](https://hub.docker.com/r/dcycle/php-lint/)
