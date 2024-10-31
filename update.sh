#!/usr/bin/env bash

docker compose down
docker compose pull
#mkdir -p ./volumes/ha/config/custom_components/
#sudo zip -r opensprinkler-backup-$(date +%Y-%m-%d) ./volumes/ha/config/custom_components/opensprinkler
#cd hass-opensprinkler
#git checkout master
#git pull
#cd ..
#sudo rm -rf ./volumes/ha/config/custom_components/opensprinkler
#cp -r hass-opensprinkler/custom_components/opensprinkler ./volumes/ha/config/custom_components/
docker image prune -f
docker compose up -d
