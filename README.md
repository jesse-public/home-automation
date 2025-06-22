Setup
---

Create reverse proxy backend network:
1. ./create-reverse-proxy-backend-network.sh

Configure env:
1. Create and update .env

[Optional] Import existing ha config
1. Copy configuration into `/volumes/ha/config/`

[Optional] Setup opensprinkler:
1. git submodule update --init --recursive

### NTP server for devices (opensprinkler)

1. `sudo apt-get update`
1. `sudo apt-get install ntp`
1. Edit ntp conf if desired `sudo nano /etc/ntp.conf`
1. `sudo systemctl restart ntp`
1. `ntpq -p`

Updating
---
1. ./update.sh

Adopting HomeKit devices
---

1. Enable multicast DNS on your networks
1. docker compose down
1. Comment out the `http` section of `/volumes/ha/config/configuration.yaml` [More info](https://www.home-assistant.io/integrations/http#reverse-proxies)
1. docker compose -f docker compose.homekit-device-adoption.yml up -d
1. Access HA at http://{IP}:8123

[More information](https://github.com/linuxserver/docker-homeassistant#host-vs-bridge)

Afterwards:
1. docker compose down
1. Uncomment the `http` section of `/volumes/ha/config/configuration.yaml`
1. docker compose up -d
