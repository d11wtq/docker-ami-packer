#!/bin/bash

sudo sh <<EOF
sleep 30

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 \
  --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9

echo 'deb http://get.docker.io/ubuntu docker main' \
  > /etc/apt/sources.list.d/docker.list

export DEBIAN_FRONTEND

apt-get -y update && apt-get -y upgrade

apt-get -y install \
  lxc-docker-$DOCKER_VERSION \
  linux-image-extra-$(uname -r)

usermod -aG docker ubuntu
EOF
