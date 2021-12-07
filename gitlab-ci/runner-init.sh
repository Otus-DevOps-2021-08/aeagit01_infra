#! /bin/bash

eval $(docker-machine env docker-host)

# docker run -d --name gitlab-runner --restart always -v \
# /srv/gitlab-runner/config:/etc/gitlab-runner -v /var/run/docker.sock:/var/run/docker.sock gitlab/gitlab-runner:latest

docker exec -it gitlab-runner gitlab-runner register \
 --url http://51.250.3.26/ \
 --non-interactive \
 --locked=false \
 --name DockerRunner \
 --executor docker \
 --docker-image alpine:latest \
 --registration-token Sqxv5uKAZsoMn7Dhtzky \
 --tag-list "linux,xenial,ubuntu,docker" \
 --run-untagged
