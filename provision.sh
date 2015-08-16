#!/bin/bash

if [[ "$(whoami)" != "root" ]]
then
  echo "Switching to root..."
  exec sudo -E -- "$0" "$@"
fi

echo "Sleeping for 30 seconds..."
sleep 30

echo "Adding apt-key for get.docker.io..."
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 \
  --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9

echo "Setting up sources for get.docker.io..."
echo 'deb http://get.docker.io/ubuntu docker main' \
  > /etc/apt/sources.list.d/docker.list

export DEBIAN_FRONTEND=noninteractive

echo "Updating system..."
apt-get -y update
apt-get -y upgrade

echo "Installing kernel extensions..."
apt-get -y install linux-image-extra-$(uname -r)

echo "Installing lxc-docker-$version..."
apt-get -y install lxc-docker-$version

echo "Adding ubuntu user to docker group..."
usermod -aG docker ubuntu

echo "Done."
