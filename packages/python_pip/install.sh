#!/bin/bash

#################################################################################################
#                                                                                                                                                                                       #
# Script de instalação pip
                                                     # #
# Autores: Ana Godoy - godoyisadora@gmail.com      #
# Abril de 2017                                                                                                                                                       #
#                                                                                                                                                                                       #
#################################################################################################

#Update
apt-get -y update

#Install
apt-get -y install python-pip
pip install --upgrade pip
