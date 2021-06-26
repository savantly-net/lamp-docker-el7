#!/bin/bash

docker image rm savantly/lamp-docker:7.0 --force && \
docker compose build && \
docker compose up  --force-recreate
