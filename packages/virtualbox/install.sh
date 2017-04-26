#!/bin/bash

#Instalando depedencias
apt-get update && apt-get install -y $(cat depedences) && rm -rf /var/lib/apt/lists/*

#Adicionando Repositório
touch /etc/apt/sources.list.d/virtualbox.list
echo "deb http://download.virtualbox.org/virtualbox/debian xenial contrib" >> /etc/apt/sources.list.d/virtualbox.list

#Adicionando Chave de Repositório
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | apt-key add -

#Instalando VirtualBox
apt-get update && apt-get -y install virtualbox-5.1