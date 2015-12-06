#!/usr/bin/env sh

setup_docker() {
  sudo apt-get install linux-image-extra-$(uname -r)
  sudo apt-get install -y docker-engine
  sudo usermod -aG docker $(whoami)
}

setup_commons () {
  sudo apt-get update
  sudo apt-get install -y vim git tmux curl wget
}

setup_repo () {
  sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
  sudo bash -c 'echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list'
}

setup_all () {
  setup_repo
  setup_commons
  setup_docker
}

setup_all
