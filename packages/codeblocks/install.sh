#!/bin/bash

#########################################################################
#								       								    #
# Script de instalação do codeblocks     	                            #
# Autores: Samuel Novaes - samuel.moura@ccc.ufcg.edu.br					#
# Abril de 2017											       		#
#								       								    #
#########################################################################

#atualiza
apt-get update -y

#instala o repositorio
yes " " | add-apt-repository ppa:damien-moore/codeblocks-stable

#atualiza e instala o codeblocks
apt-get update -y && apt-get install -y codeblocks
