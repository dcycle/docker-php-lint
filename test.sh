#!/bin/bash
#
# CI testing.
#
set -e

docker build -f="Dockerfile2" -t local-dcycle-php-lint-image .
docker run --rm local-dcycle-php-lint-image --help
docker build -f="Dockerfile3" -t local-dcycle-php-lint-image .
docker run --rm local-dcycle-php-lint-image --help
