#!/bin/bash

#########################################################################
#								       								#
# Script de instalação do MongoDB  	#
# Autores: Samuel Novaes - samuel.moura@ccc.ufcg.edu.br             #
# Maio de 2017											       		#
#								       								#
#########################################################################

# importa a chave publica
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6

# baixa o repositorio do mongodb
echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.4.list

# atualiza os repositorios e instala o mongodb
apt-get -y update && apt-get install -y mongodb-org

# adiciona arquivos de configuração
cat ./config >> /etc/systemd/system/mongodb.service

# abilita o serviço no sistema
systemctl enable mongodb
