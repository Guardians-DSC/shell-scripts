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
apt-get -y install linux-tools-common
perf 

apt-get -y install linux-cloud-tools-4.9.13-moby

#Install C compiler

apt-get -y install gcc g++

#Compiling the program necessary for the perf
make cpu_burn

