#!/usr/bin/env bash
docker-compose down
docker image rm ghcr.io/home-assistant/home-assistant:stable
docker image prune -f
sudo zip -r opensprinkler-backup-$(date +%Y-%m-%d) ./volumes/config/custom_components/opensprinkler
cd hass-opensprinkler
git pull
cd ..
sudo rm -rf ./volumes/config/custom_components/opensprinkler
cp -r hass-opensprinkler/custom_components/opensprinkler ./volumes/config/custom_components/
docker image pull ghcr.io/home-assistant/home-assistant:stable
COMPOSE_HTTP_TIMEOUT=720 docker-compose up -d
