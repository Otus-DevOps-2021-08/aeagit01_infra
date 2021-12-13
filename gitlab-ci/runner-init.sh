#! /bin/bash

eval $(docker-machine env docker-host)

# docker run -d --name gitlab-runner --restart always -v \
# /srv/gitlab-runner/config:/etc/gitlab-runner -v /var/run/docker.sock:/var/run/docker.sock gitlab/gitlab-runner:latest

docker exec -it gitlab-runner gitlab-runner register \
 --url http://<external_ip>/ \
 --non-interactive \
 --locked=false \
 --name DockerRunner \
 --executor docker \
 --docker-image alpine:latest \
 --registration-token <Token> \
 --tag-list "linux,xenial,ubuntu,docker" \
 --run-untagged
