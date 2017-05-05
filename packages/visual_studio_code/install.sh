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
yes '' | add-apt-repository -y "deb https://packages.microsoft.com/repos/vscode stable main"
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EB3E94ADBE1229CF
apt-get-y update
apt-get -y install code
