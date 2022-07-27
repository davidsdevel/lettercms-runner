cat > /etc/systemd/system/gitlab-runner.service.d/override.conf <<EOF
[Service]
User=gitlab-runner
Group=gitlab-runner
ExecStartPre=+ln -sf /var/run/podman/podman.sock /var/run/docker.sock
ExecStart=
ExecStart=strace -e getuid,getgid -e inject=getuid:retval=0 -e inject=getgid:retval=0 -- /usr/bin/gitlab-runner run --working-directory /home/gitlab-runner --config /etc/gitlab-runner/config.toml --service gitlab-runner --user gitlab-runner
EOF