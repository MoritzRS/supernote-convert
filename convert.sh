#!/bin/bash
set -e;

IMAGE="supernote-convert";
CONTEXT="./.container";
CONTAINER="$CONTEXT/Containerfile";


RUNTIME="podman";
if [ -z "$(command -v $RUNTIME)" ]; then
    RUNTIME="docker";
    if [ -z "$(command -v $RUNTIME)" ]; then
        echo "No Container Runtime Found";
        exit 1;
    fi
fi


if [ -z "$($RUNTIME images -q $IMAGE 2> /dev/null)" ]; then
    $RUNTIME build --platform linux/amd64 -t $IMAGE:latest -f $CONTAINER $CONTEXT;
fi

$RUNTIME run --rm \
    --platform linux/amd64 \
    --volume $(pwd)/input:/converter/input:ro \
    --volume $(pwd)/output:/converter/output:rw \
    $IMAGE;