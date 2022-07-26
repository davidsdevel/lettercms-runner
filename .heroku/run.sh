#!/bin/bash

export HTTP_PROXY="http://lettercms-runner.herokuapp.com"
export HTTPS_PROXY="https://lettercms-runner.herokuapp.com"

echo $HTTPS_PROXY

fakesu -c gitlab-runner register \
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