#!/bin/bash

apt-get update
apt-get install -y useradd

mkdir $BUILD_DIR/bin
mkdir $BUILD_DIR/gitlab-runner

echo "Fetching binaries"
curl -L --output $BUILD_DIR/bin/gitlab-runner "https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64"

chmod +x $BUILD_DIR/bin/gitlab-runner

export  PATH=$BUILD_DIR/bin

useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash


gitlab-runner install --user=gitlab-runner --working-directory=$BUILD_DIR/gitlab-runner
gitlab-runner start
