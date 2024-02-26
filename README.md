Setup
---

Create reverse proxy network:
1. ./create-nginx-network.sh

Configure env:
1. Create and update .env

Setup reverse proxy:
1. Create and update ha.home.conf in `/volumes/nginx/config/nginx/site-confs/`
1. Add cert to `/volumes/nginx/config/certs`
1. Add key to `/volumes/nginx/config/keys`
1. Update ha configuration.yaml to trust the reverse proxy:
```yml
http:
  # Disable the following for temporary HomeKit device adoption.
  use_x_forwarded_for: true
  trusted_proxies:
    - !env_var REVERSE_PROXY_IP_ADDRESS
```

[Optional] Import existing ha config
1. Copy configuration into `/volumes/ha/config/`

[Optional] Setup opensprinkler:
1. git submodule update --init --recursive

Updating
---
1. ./update.sh

Adopting HomeKit devices
---

1. Enable multicast DNS on your networks
1. docker-compose down
1. Comment out the `http` section of `/volumes/ha/config/configuration.yaml` [More info](https://www.home-assistant.io/integrations/http#reverse-proxies)
1. docker-compose -f docker-compose.homekit-device-adoption.yml up -d
1. Access HA at http://{IP}:8123

[More information](https://github.com/linuxserver/docker-homeassistant#host-vs-bridge)

Afterwards:
1. docker-compose down
1. Uncomment the `http` section of `/volumes/ha/config/configuration.yaml`
1. docker-compose up -d
