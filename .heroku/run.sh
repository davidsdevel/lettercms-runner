#!/bin/bash

apt-get update
apt-get install -y su-exec
echo whoami
echo "$USER"

mkdir $BUILD_DIR/bin
mkdir $BUILD_DIR/gitlab-runner

echo "Fetching binaries"
curl -L --output $BUILD_DIR/bin/gitlab-runner "https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64"

chmod +x $BUILD_DIR/bin/gitlab-runner

export  PATH=$BUILD_DIR/bin

useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash


su-exec non-root gitlab-runner install --user=gitlab-runner --working-directory=$BUILD_DIR/gitlab-runner
su-exec non-root gitlab-runner start
