#!/bin/bash

BUILD_DIR=$1
CACHE_DIR=$2
ENV_DIR=$3

echo
echo "-----> HOME        => $HOME"
echo "-----> BUILD_DIR   => $BUILD_DIR"
echo "-----> CACHE_DIR   => $CACHE_DIR"

echo "Uninstalling packages"
apt-get remove docker docker-engine docker.io containerd runc

echo "Downloading packages"
curl -s "https://download.docker.com/linux/ubuntu/dists/focal/pool/stable/amd64/containerd.io_1.6.6-1_amd64.deb" -o $BUILD_DIR/containerd.deb
curl -s "https://download.docker.com/linux/ubuntu/dists/focal/pool/stable/amd64/docker-ce-cli_20.10.9~3-0~ubuntu-focal_amd64.deb" -o $BUILD_DIR/ce-cli.deb
curl -s "https://download.docker.com/linux/ubuntu/dists/focal/pool/stable/amd64/docker-ce-rootless-extras_20.10.9~3-0~ubuntu-focal_amd64.deb" -o $BUILD_DIR/ce-rootless.deb
curl -s "https://download.docker.com/linux/ubuntu/dists/focal/pool/stable/amd64/docker-ce_20.10.9~3-0~ubuntu-focal_amd64.deb" -o $BUILD_DIR/ce.deb
curl -s "https://download.docker.com/linux/ubuntu/dists/focal/pool/stable/amd64/docker-compose-plugin_2.6.0~ubuntu-focal_amd64.deb" -o $BUILD_DIR/compose.deb
curl -s "https://download.docker.com/linux/ubuntu/dists/focal/pool/stable/amd64/docker-scan-plugin_0.9.0~ubuntu-focal_amd64.deb" -o $BUILD_DIR/scan.deb

echo "Installing packages"
dpkg -i $BUILD_DIR/containerd.deb
dpkg -i $BUILD_DIR/ce-cli.deb
dpkg -i $BUILD_DIR/ce-rootless.deb
dpkg -i $BUILD_DIR/ce.deb
dpkg -i $BUILD_DIR/compose.deb
dpkg -i $BUILD_DIR/scan.deb

docker run hello-world
