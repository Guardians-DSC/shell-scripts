#!/bin/bash

#########################################################################
#								       								#
# Script de instalação do PyCharm  	#
# Autores: Samuel Novaes - samuel.moura@ccc.ufcg.edu.br             #
# Maio de 2017											       		#
#								       								#
#########################################################################

# atualiza
apt-get -y update

# instala pendencias para baixar o repositorio
apt-get -y install software-properties-common python-software-properties

# baixar o repositorio
yes ' ' | add-apt-repository ppa:mystic-mirage/pycharm

# atualiza os repositorios e instala o pycharm
apt-get -y update && apt-get -y install pycharm-community

