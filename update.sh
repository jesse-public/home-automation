#!/usr/bin/env bash

docker compose down
docker compose pull

mkdir -p ./volumes/ha/config/custom_components/

#sudo zip -r opensprinkler-backup-$(date +%Y-%m-%d) ./volumes/ha/config/custom_components/opensprinkler
#cd hass-opensprinkler
#git pull
#cd ..
#sudo rm -rf ./volumes/ha/config/custom_components/opensprinkler
#cp -r hass-opensprinkler/custom_components/opensprinkler ./volumes/ha/config/custom_components/

sudo zip -r frigate-hass-integration-backup-$(date +%Y-%m-%d) ./volumes/ha/config/custom_components/frigate-hass-integration
cd frigate-hass-integration
git pull
cd ..
sudo rm -rf ./volumes/ha/config/customer_components/frigate-hass-integration
cp -r frigate-hass-integration/custom_components/frigate ./volumes/ha/config/custom_components/

docker image prune -f
docker compose up -d
