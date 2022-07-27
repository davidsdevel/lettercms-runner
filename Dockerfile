FROM gitlab/gitlab-runner:alpine

RUN apk update
RUN apk upgrade

CMD register \
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