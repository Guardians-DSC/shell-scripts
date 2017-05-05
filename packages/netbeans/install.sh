#!/bin/bash

#Install Java
echo "===> add webupd8 repository..."  && \
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list  && \
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list  && \
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 && \
apt-get update  && \
\
\
echo "===> install Java"  && \
echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections  && \
echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections  && \
DEBIAN_FRONTEND=noninteractive  apt-get install -y --force-yes oracle-java8-installer oracle-java8-set-default  && \
\
\
echo "===> clean up..."  && \
rm -rf /var/cache/oracle-jdk8-installer  && \
apt-get clean  && \
rm -rf /var/lib/apt/lists/*

# Install add-apt-repository
apt-get install -y \
  software-properties-common \
  unzip

add-apt-repository ppa:vajdics/netbeans-installer
apt-get update && apt-get install -y netbeans-installer
