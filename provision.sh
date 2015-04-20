#!/bin/bash

sudo version=$docker_version sh <<'EOF'
export DEBIAN_FRONTEND=noninteractive

cmp_url=https://github.com/docker/compose/releases/download
cmp_bin=docker-compose-Linux-x86_64
cmp_ver=1.1.0

sleep 30

curl -L $cmp_url/$cmp_ver/$cmp_bin > /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 \
  --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9

echo 'deb http://get.docker.io/ubuntu docker main' \
  > /etc/apt/sources.list.d/docker.list

apt-get -y update
apt-get -y upgrade
apt-get -y install linux-image-extra-$(uname -r)
apt-get -y install lxc-docker-$version

usermod -aG docker ubuntu
EOF
