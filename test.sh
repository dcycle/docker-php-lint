set -e
docker pull node
docker pull dcycle/php-lint
docker build -t local-dcycle-php-lint-image .

docker run --rm local-dcycle-php-lint-image --help

docker run --rm dcycle/php-lint:1 --help
