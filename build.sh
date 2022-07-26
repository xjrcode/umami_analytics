#!/bin/bash -e

if (( $# == 0 )); then
    echo "Missing version parameter"
    exit
fi

echo "Building version $1"

# download original repository
if [ ! -d ./umami ]; then
    git clone git@github.com:umami-software/umami.git umami
fi

cd umami

# build
export DOCKER_BUILDKIT=1
docker build --no-cache \
             --build-arg DATABASE_TYPE=postgresql \
             --build-arg BASE_PATH=/analytics \
             --build-arg DISABLE_TELEMETRY=1 \
             -t xjrcode/umami_analytics:$1 \
             -t xjrcode/umami_analytics:latest \
             .

# clean
cd ..
rm -rf umami
