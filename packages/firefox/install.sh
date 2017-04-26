#!/bin/bash

#########################################################################
#								       								    #
# Script de instalação do Firefox       	                            #
# Autores: Victor Hugo - victorhundo@gmail.com 							#
# Janeiro de 2017											       		#
#								       								    #
#########################################################################

#Atualiza e instala dependencias
apt-get update && apt-get install $(cat depedences) && rm -rf /var/lib/apt/lists/*

#Armazena link do download do firefox em variavel
FIREFOX_LINK="https://download.mozilla.org/?product=firefox-50.1.0-SSL&os=linux64&lang=pt-BR"

#Faz download do firefox
wget $FIREFOX_LINK --output-document=firefox.tar.bz2

#Descompacta e instala firefox
tar xvjf firefox.tar.bz2

#Move pasta do firefox para /opt/
mv firefox /opt/

#Cria link simbolico
ln -s /opt/firefox/firefox /usr/bin/firefox

#Cria icone na barra de ferramentas do sistema
cp conf/firefox.desktop /usr/share/applications/

#Apaga arquivo de download
rm -rfv firefox.tar.bz2
