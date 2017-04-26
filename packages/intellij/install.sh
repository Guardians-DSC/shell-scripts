#!/bin/bash

#########################################################################
#								       								    #
# Script de instalação do Intellij     	                                #
# Autores: Victor Hugo - victorhundo@gmail.com 							#
# Janeiro de 2017											       		#
#								       								    #
#########################################################################

#Atualiza e instala dependencias
apt-get update && apt-get install $(cat depedences) && rm -rf /var/lib/apt/lists/*

#Faz download do intellij
wget https://download.jetbrains.com/idea/ideaIU-2016.3.3.tar.gz

#Descompacta intellij para a pasta /opt/
tar -xf  ideaIU-2016.3.3.tar.gz -C /opt/

#Entra na pasta bin dentro de /opt/
cd /opt/idea-IU-163.11103.6/bin

#Executa o script de instalação do intellij
./idea.sh

#Apaga o arquivo de download
rm -rfv ideaIU-2016.3.3.tar.gz
