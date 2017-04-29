#!/bin/bash

#################################################################################################
#                                                                                                                                                                                       #
# Script de instalaï¿½ïAndroid Studio
                                                     # #
# Autores: Ana Godoy - godoyisadora@gmail.com      #
# Abril de 2017                                                                                                                                                       #
#                                                                                                                                                                                       #
#################################################################################################

#Update
apt-get -y update

#Install Java6
apt-get -y install software-properties-common python-software-properties
apt-get -y  update
apt-get -y install default-jre
apt-get -y install default-jdk
yes '' | add-apt-repository ppa:webupd8team/java
apt-get -y update
apt-get -y install java-common oracle-java8-installer
apt-get -y install oracle-java8-set-default
source /etc/profile

#Install Android Studio
yes '' | add-apt-repository ppa:maarten-fonville/android-studio
apt-get -y update
apt-get -y install android-studio

