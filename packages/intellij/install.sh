#!/bin/bash

#########################################################################
#								       								    #
# Script de instalação do Intellij     	                                #
# Autores: Victor Hugo - victorhundo@gmail.com 							#
# Janeiro de 2017											       		#
#								       								    #
#########################################################################

#Atualiza e instala dependencias
apt-get -y update && apt-get install $(cat depedences) && rm -rf /var/lib/apt/lists/*

#Faz download do intellij
wget https://download.jetbrains.com/idea/ideaIU-2017.1.2.tar.gz --output-document=intellij.tar.gz

#Descompacta intellij para a pasta temporaria
tar -xf  intellij.tar.gz -C ./intellij/

### moving package to /opt
mv ./intellij/* intellij/ij
mv ./intellij/ij /opt/intellij

### executa instalavel
sh /opt/intellij/bin/idea.sh

#Apaga o arquivo de download
rm -rfv intellij.tar.gz

### grant access to all
chmod +x /opt/intellij/bin/.sh

### creating soft link
from=/opt/intellij/bin/intellij
to=/usr/local/bin
ln -s $from $to

#Create Desktop Icon
cp ./desktop-icon/intellij.desktop /usr/share/applications/
