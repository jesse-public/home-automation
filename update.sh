#!/usr/bin/env bash

docker-compose down
docker-compose pull
mkdir -p ./volumes/config/custom_components/
sudo zip -r opensprinkler-backup-$(date +%Y-%m-%d) ./volumes/config/custom_components/opensprinkler
cd hass-opensprinkler
git pull
cd ..
sudo rm -rf ./volumes/config/custom_components/opensprinkler
cp -r hass-opensprinkler/custom_components/opensprinkler ./volumes/config/custom_components/
docker image prune -f
COMPOSE_HTTP_TIMEOUT=720 docker-compose up -d
