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

mkdir -p $CACHE_DIR $VENDOR_DIR

# DOCKER_VERSION=20.10.8
# COMPOSE_VERSION=v2.0.1

echo "-----> Downloading docker CLI $DOCKER_VERSION from $DOCKER_URL"
curl -s "https://download.docker.com/linux/static/stable/x86_64/docker-20.10.9.tgz" -o $HOME/docker.tgz

echo "-----> Installing docker under /app/vendor"
tar -zxf $HOME/docker.tgz -C $HOME/bin/docker
chmod +x $HOME/bin/docker

export PATH=$PATH:$HOME/bin

docker run hello-world