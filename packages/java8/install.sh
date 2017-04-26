#!/bin/bash

#Adicionando repositório
touch /etc/apt/sources.list.d/webupd8team-java.list
cat conf/repositorio >> /etc/apt/sources.list.d/webupd8team-java.list

#Adicionando Chave do repositório
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886

#Instalando java8 e setando como defaul
apt-get update && apt-get install -y oracle-java8-installer
printf "yes\\n" | apt-get install -y --allow-unauthenticated oracle-java8-set-default
