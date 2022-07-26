#!/bin/bash

BUILD_DIR=$1
CACHE_DIR=$2
ENV_DIR=$3
VENDOR_DIR=$BUILD_DIR/vendor
PLUGINS_DIR=$BUILD_DIR/.docker/cli-plugins

echo
echo "-----> HOME        => $HOME"
echo "-----> BUILD_DIR   => $BUILD_DIR"
echo "-----> CACHE_DIR   => $CACHE_DIR"
echo "-----> VENDOR_DIR  => $VENDOR_DIR"
echo "-----> PLUGINS_DIR => $PLUGINS_DIR"

mkdir -p /app/bin

# DOCKER_VERSION=20.10.8
# COMPOSE_VERSION=v2.0.1

echo "-----> Downloading docker CLI"
curl -s "https://download.docker.com/linux/static/stable/x86_64/docker-20.10.9.tgz" -o /app/bin/docker.tgz
curl -s "https://download.docker.com/linux/static/stable/x86_64/docker-rootless-extras-20.10.9.tgz" -o /app/bin/rootless.tgz

echo "-----> Installing docker under /app/vendor"
cd /app/bin

tar xzvf docker.tgz
tar xzvf rootless.tgz

cd docker
chmod +x docker

cd ../docker-rootless-extras
chmod +x dockerd-rootless.sh

export PATH=$PATH:/app/bin/docker
export PATH=$PATH:/app/bin/docker-rootless-extras

cd /app

dockerd-rootless.sh
docker run hello-world
