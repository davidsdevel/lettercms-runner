#!/bin/bash

echo "$USER"
whoami

mkdir $BUILD_DIR/runner-bin
mkdir $BUILD_DIR/gitlab-runner

echo "Fetching runner"
curl -L --output $BUILD_DIR/runner-bin/gitlab-runner "https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64"

chmod +x $BUILD_DIR/runner-bin/gitlab-runner

export  PATH=$BUILD_DIR/runner-bin

sudo gitlab-runner install --user=$USER --working-directory=$BUILD_DIR/gitlab-runner
sudo gitlab-runner start
