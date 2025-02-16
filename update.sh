#!/usr/bin/env bash

docker compose down
docker compose pull

git submodule init
git submodule update

# mkdir -p ./volumes/ha/config/custom_components
#sudo zip -r opensprinkler-backup-$(date +%Y-%m-%d) ./volumes/ha/config/custom_components/opensprinkler
#cd hass-opensprinkler
#git pull
#cd ..
#sudo rm -rf ./volumes/ha/config/custom_components/opensprinkler
#cp -r hass-opensprinkler/custom_components/opensprinkler ./volumes/ha/config/custom_components/

mkdir -p ./volumes/ha/config/custom_components
sudo zip -r frigate-hass-integration-backup-$(date +%Y-%m-%d) ./volumes/ha/config/custom_components/frigate
cd frigate-hass-integration
git pull
cd ..
sudo rm -rf ./volumes/ha/config/customer_components/frigate
cp -r frigate-hass-integration/custom_components/frigate ./volumes/ha/config/custom_components/

cd lovelace-mushroom
git fetch --tags
LATEST_TAG=$(git describe --tags $(git rev-list --tags --max-count=1))
cd ..
mkdir -p ./volumes/ha/config/www
ASSET_URL="https://github.com/piitaya/lovelace-mushroom/releases/download/$LATEST_TAG/mushroom.js"
curl -L -o "./volumes/ha/config/www/mushroom.js" "$ASSET_URL"

cd Bubble-Card
git pull
cd ..
mkdir -p ./volumes/ha/config/www
cp ./Bubble-Card/dist/bubble-card.js volumes/ha/config/www/
cp ./Bubble-Card/dist/bubble-pop-up-fix.js volumes/ha/config/www/

docker image prune -f
docker compose up -d
