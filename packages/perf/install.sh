#!/bin/bash

#################################################################################################
#                                                                                                                                                                                       #
# Script de instalação erf                                                                                                                                    # #
# Autores: Ana Godoy - godoyisadora@gmail.com      #
# Abril de 2017                                                                                                                                                       #
#                                                                                                                                                                                       #
#################################################################################################

#Update
apt-get -y update

#Install
apt-get -y install systemtap
sudo stap -e 'probe begin { printf("Hello, World!\n"); exit() }'
apt-get  install linux-tools-common
#apt-get -y install linux-tools-moby
#apt-get -y install linux-cloud-tools-moby 
#apt-get -y install linux-tools-4.9.13-moby
#apt-get -y install linux-cloud-tools-4.9.13-moby


