#!/bin/bash

REPO_URL=savantly/lamp-docker
IMAGE_TAGS=("8" "8.2" "latest")

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR

# For each tag, build and push
for tag in "${IMAGE_TAGS[@]}"
do
    echo "Building $REPO_URL:$tag"
    docker buildx build \
    --push \
    --platform linux/arm64/v8,linux/amd64 \
    -t $REPO_URL:$tag .
done
