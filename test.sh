#!/bin/bash
#
# CI testing.
#
set -e

echo ""
echo ""
echo "Starting tests!"
echo ""
echo ""

echo " => Building version 2 for php 7"
docker build --progress=plain -f="Dockerfile2" -t local-dcycle-php-lint-image .
echo " => Running the help command (smoke test)"
docker run --rm local-dcycle-php-lint-image --help
echo " => Testing with Drupal"
docker run --rm -v "$(pwd)/example01":/code local-dcycle-php-lint-image --standard=Drupal /code
echo " => Expecting this to fail"
! docker run --rm -v "$(pwd)/example02":/code local-dcycle-php-lint-image --standard=Drupal /code

echo " => Building version 3 for php 8"
docker build --progress=plain -f="Dockerfile3" -t local-dcycle-php-lint-image .
echo " => Running the help command (smoke test)"
docker run --rm local-dcycle-php-lint-image --help
echo " => Testing with Drupal"
docker run --rm -v "$(pwd)/example01":/code local-dcycle-php-lint-image --standard=Drupal /code
! docker run --rm -v "$(pwd)/example02":/code local-dcycle-php-lint-image --standard=Drupal /code

echo ""
echo ""
echo "All done with tests!"
echo ""
echo ""
