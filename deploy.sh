#!/bin/bash

REPO_URL=savantly/lamp-docker:8.1

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR

docker buildx build \
--push \
--platform linux/arm64/v8,linux/amd64 \
-t $REPO_URL .

#docker push $REPO_URL