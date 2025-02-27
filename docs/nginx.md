
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
