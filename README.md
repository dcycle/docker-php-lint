Lint PHP projects, including with the Drupal coding standard.

For example:

    docker run -v $(pwd):/code dcycle/php-lint --standard=DrupalPractice /code
    docker run -v $(pwd):/code dcycle/php-lint --standard=Drupal /code
    docker run -v $(pwd):/code dcycle/php-lint /code

Get help like this:

    docker run -v $(pwd):/code dcycle/php-lint

To ignore certain lines in your PHP files:

    // @codingStandardsIgnoreStart
    ... 
    // @codingStandardsIgnoreEnd


Resources
-----

 * [This image on Docker.io](https://hub.docker.com/r/dcycle/php-lint/)
