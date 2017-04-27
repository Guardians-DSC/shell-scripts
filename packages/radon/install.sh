#!/bin/bash

#################################################################################################
#                                                                                                                                                                                       #
# Script de instalação radon                                                                                                                        # #
# Autores: Ana Godoy - godoyisadora@gmail.com      #
# Abril de 2017                                                                                                                                                       #
#                                                                                                                                                                                       #
#################################################################################################

#Update
apt-get -y update

#Install pip
apt-get -y install python-pip
pip install --upgrade pip

#Install radon
pip install radon
