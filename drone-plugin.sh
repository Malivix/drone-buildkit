#!/bin/sh

set -euo pipefail

FRONTEND=${PLUGIN_FRONTEND:-dockerfile.v0}
CONTEXT=${PLUGIN_CONTEXT:-$PWD/test}
DOCKERFILE=${PLUGIN_DOCKERFILE:-./test}
REGISTRY=${PLUGIN_REGISTRY:-registry.ghaf.cloud}
REPO=${PLUGIN_REPO:-library/drone-buildkit-test}
CACHE_REPO=${PLUGIN_CACHE_REPO:-library/drone-buildkit-test}

mkdir -p cache

buildctl-daemonless.sh --debug build \
    --frontend=${FRONTEND} \
    --local context=${CONTEXT} \
    --local dockerfile=${DOCKERFILE} \
    --output type=docker,name=${REPO},dest=/home/out/output.tar \
    --export-cache type=local,dest=/home/cache \
    --import-cache type=local,src=/home/cache
