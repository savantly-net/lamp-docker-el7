#!/bin/bash

docker image rm savantly/lamp-docker:8.0 --force && \
docker compose build && \
docker compose up  --force-recreate
