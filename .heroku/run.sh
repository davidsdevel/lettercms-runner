#!/bin/bash

echo "$USER"
whoami

mkdir $BUILD_DIR/bin
mkdir $BUILD_DIR/gitlab-runner

echo "Fetching binaries"
curl -L --output $BUILD_DIR/bin/gitlab-runner "https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64"

chmod +x $BUILD_DIR/bin/gitlab-runner

export  PATH=$BUILD_DIR/bin

gitlab-runner install --user=$USER --working-directory=$BUILD_DIR/gitlab-runner
gitlab-runner start
