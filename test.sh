#!/bin/bash
#
# CI testing.
#
set -e

docker build -f="Dockerfile2" -t local-dcycle-php-lint-image .
docker run --rm local-dcycle-php-lint-image --help
docker run --rm -v "$(pwd)":/code local-dcycle-php-lint-image --standard=DrupalPractice /code
docker run --rm -v "$(pwd)":/code local-dcycle-php-lint-image /code
docker build -f="Dockerfile3" -t local-dcycle-php-lint-image .
docker run --rm local-dcycle-php-lint-image --help
docker run --rm -v "$(pwd)":/code local-dcycle-php-lint-image --standard=DrupalPractice /code
docker run --rm -v "$(pwd)":/code local-dcycle-php-lint-image /code

echo ""
echo ""
echo "All done with tests!"
echo ""
echo ""
