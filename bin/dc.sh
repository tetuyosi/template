#!/bin/bash

cd $(cd $(dirname ${BASH_SOURCE:-$0})/../; pwd)

APP=( docker exec -i template_app_1 ash )

echo "### Booting containers"
docker-compose up -d
echo

if [ ! -e src/vendor ]; then
  echo 'composer install' | "${APP[@]}"
fi
