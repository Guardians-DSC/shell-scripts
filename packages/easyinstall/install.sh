#!/bin/bash

#########################################################################
#								       								    #
# Script de instalação do Easy_Install e SimpleJson	                	#
# Autores: Victor Hugo - victorhundo@gmail.com 							#
# Janeiro de 2017											       		#
#								       								    #
#########################################################################

#Atualiza repositorios
apt-get update

#Instala easy_install
apt-get install -y python-setuptools

#Instala simplejson
easy_install simplejson
