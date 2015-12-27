#!/usr/bin/env sh

setup_docker() {
  sudo apt-get install linux-image-extra-$(uname -r)
  sudo apt-get install -y docker-engine
  sudo usermod -aG docker $(whoami)
}

setup_commons () {
  sudo apt-get update
  sudo apt-get install -y vim git tmux curl wget unzip build-essential libssl-dev libffi-dev python-dev
  sudo apt-get install python-software-properties
  sudo apt-get install oracle-java7-installer 
}

setup_repo () {
  sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
  sudo bash -c 'echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list'
  # for Oracle JDK
  sudo add-apt-repository ppa:webupd8team/java

  sudo apt-get update
}

setup_python() {
  sudo apt-get install -y python-dev python-pip
  sudo pip install virtualenv
}

setup_scala() {
  sudo apt-get remove scala-library scala
  wget http://www.scala-lang.org/files/archive/scala-2.10.6.deb
  sudo dpkg -i scala-2.10.6.deb

  echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823
  sudo apt-get update
  sudo apt-get install scala sbt
}

setup_all () {
  setup_repo
  setup_commons
  setup_python
  setup_docker
  setup_scala
}

#setup_all
#setup_scala
