#!/usr/bin/env bash

docker network create \
--driver=bridge \
--internal \
--ip-range=172.173.0.0/24 \
--subnet=172.173.0.0/24 \
--gateway=172.173.0.1 \
ha-reverse-proxy-backend
