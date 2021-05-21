#!/bin/bash

REPO_URL=savantly/lamp-docker-el7

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR

docker build -t $REPO_URL .
docker push $REPO_URL