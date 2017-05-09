#!/bin/bash

#########################################################################
#								       								    #
# Script de instalação do Slack	       	                                #
# Autores: Victor Hugo - victorhundo@gmail.com 							#
# Janeiro de 2017											       		#
#								       								    #
#########################################################################

#Atualiza e instala dependencias
apt-get update && apt-get install $(cat depedences) && rm -rf /var/lib/apt/lists/*

#Baixa slack
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-2.4.2-amd64.deb

#Instala slack
dpkg -i slack-desktop-2.4.2-amd64.deb

#Corrige problemas (caso haja) da instalação
apt-get -f install

rm slack-desktop-2.4.2-amd64.deb
