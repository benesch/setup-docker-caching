#!/usr/bin/env bash

# This can be greatly simplified once https://github.com/docker/buildx/pull/535
# and https://github.com/moby/buildkit/pull/1974 are widely distributed.

set -euo pipefail

mkdir ~/.docker/cli-plugins
docker create --name buildx-bin docker/buildx-bin@sha256:758113152d1d1b1645b512199ee36752a07f58257093260dbf58b22f44aef745 /buildx
docker cp buildx-bin:/buildx ~/.docker/cli-plugins/docker-buildx
docker rm buildx-bin
docker buildx version
docker buildx install
docker buildx create \
    --use \
    --driver-opt image=moby/buildkit@sha256:9ad9a9f061d556197b150959da0a1e1d51b8e07b7171ceec3cacd36a60139d5c,network=host \
    --buildkitd-flags --debug
docker buildx inspect --bootstrap
