#! /bin/bash

ycip=$(yc compute instance create \
--name docker-host \
--zone ru-central1-a \
--cores=2 \
--memory=4 \
--network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
--create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1804-lts,size=50 \
--ssh-key ~/.ssh/appuser.pub|grep -E '([[:space:]]{5})(address:[[:space:]])'| grep -Eo1 '(\d{1,3}.\d{1,3}.\d{1,3}.\d{1,3})')

docker-machine create --driver generic \
--generic-ip-address=$ycip \
--generic-ssh-user yc-user \
--generic-ssh-key ~/.ssh/appuser docker-host

eval $(docker-machine env docker-host)
