Lint PHP projects, including with the Drupal coding standard.

This image was first created on December 2nd, 2016 and was not updated before Dec. 12, 2019. If you have a project which uses the image from before Dec. 12, 2019, use tag 1. After Dec. 12, 2019, this project will be rebuilt every week using the latest version of the software, and use tag 2.

For example:

    docker run -v $(pwd):/code dcycle/php-lint:2 --standard=DrupalPractice /code
    docker run -v $(pwd):/code dcycle/php-lint:2 --standard=Drupal /code
    docker run -v $(pwd):/code dcycle/php-lint:2 /code

Get help like this:

    docker run -v $(pwd):/code dcycle/php-lint:2 --help

Resources
-----

 * [This image on Docker.io](https://hub.docker.com/r/dcycle/php-lint/)
