#!/bin/bash

#################################################################################################
#                                                                                                                                                                                       #
# Script de instalaï¿½ï   Visual Studio Code                                                  
                                                     # #
# Autores: Ana Godoy - godoyisadora@gmail.com      #
# Abril de 2017                                                                                                                                                       #
#                                                                                                                                                                                       #
#################################################################################################

#Update
apt-get -y update

#Install Visual Studio Code
apt-get -y install software-properties-common python-software-properties
apt-get -y  update
yes '' | add-apt-repository ppa:ubuntu-desktop/ubuntu-make
apt-get -y update
apt-get -y install ubuntu-make

umake web visual-studio-code
