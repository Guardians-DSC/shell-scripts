#!/bin/bash

#########################################################################
#								       								    #
# Script de instalação do "oh my zsh"    	                            #
# Autores: Samuel Novaes - samuel.moura@ccc.ufcg.edu.br					#
# Abril de 2017											       		#
#								       								    #
#########################################################################

#atualiza
apt-get update

#instala o curl
apt-get install curl

#instala o git
apt-get install git

#instal o zsh
apt-get install zsh

#baixa e executa o ohmyz
curl -L http://install.ohmyz.sh | sh
