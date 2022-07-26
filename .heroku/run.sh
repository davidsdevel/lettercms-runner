#!/bin/bash

docker volume create gitlab-runner-config

docker run -d --name gitlab-runner --restart always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v gitlab-runner-config:/etc/gitlab-runner \
    p $PORT:8093 \
    gitlab/gitlab-runner:latest

docker run --rm -v gitlab-runner-config:/etc/gitlab-runner gitlab/gitlab-runner:latest register \
  --non-interactive \
  --url "https://gitlab.com/" \
  --registration-token "$GITLAB_TOKEN" \
  --executor "docker" \
  --docker-image alpine:latest \
  --description "lettercms-runner" \
  --maintenance-note "Free-form maintainer notes about this runner" \
  --tag-list "docker,aws" \
  --run-untagged="true" \
  --locked="false" \
  --access-level="not_protected"
