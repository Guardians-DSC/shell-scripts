#!/bin/bash

#################################################################################################
#                                                                                                                                                                                       #
# Script de instalação PyYAML
                                                     # #
# Autores: Ana Godoy - godoyisadora@gmail.com      #
# Abril de 2017                                                                                                                                                       #
#                                                                                                                                                                                       #
#################################################################################################

#Update
apt-get -y update

#Install pip
apt-get -y install python-pip
pip install --upgrade pip

#Install PyYaml
pip install pyyaml
