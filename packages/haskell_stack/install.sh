#!/bin/bash

#################################################################################################
#                                                                                                                                                                                       #
# Script de instala��haskell-stack                                                                                                                           # #
# Autores: Ana Godoy - godoyisadora@gmail.com      #
# Abril de 2017                                                                                                                                                       #
#                                                                                                                                                                                       #
#################################################################################################

#Update
apt-get -y update

#Install
wget -qO- https://get.haskellstack.org/ | sh


