#!/bin/bash

export HTTP_PROXY="http://{$RUNNER_NAME}.herokuapp.com"
export HTTPS_PROXY="https://{$RUNNER_NAME}.herokuapp.com"

echo $HTTPS_PROXY

gitlab-runner register \
  --non-interactive \
  --url "https://gitlab.com/" \
  --registration-token "$GITLAB_TOKEN" \
  --executor "docker" \
  --docker-image alpine:latest \
  --description "$RUNNER_NAME" \
  --maintenance-note "Free-form maintainer notes about this runner" \
  --tag-list "docker,aws" \
  --run-untagged="true" \
  --locked="false" \
  --access-level="not_protected"
