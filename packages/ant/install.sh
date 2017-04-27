#!/bin/bash

#################################################################################################
#                                                                                                                                                                                       #
# Script de instalaçãoANT                                                                                                                         # #
# Autores: Ana Godoy - godoyisadora@gmail.com      #
# Abril de 2017                                                                                                                                                       #
#                                                                                                                                                                                       #
#################################################################################################

#Update
apt-get -y update

#Install Java 8
apt-get -y install software-properties-common python-software-properties
yes ' ' | add-apt-repository ppa:webupd8team/java
apt-get -y update
apt-get -y install oracle-java8-installer

#Install ANT
apt-get -y install ant

