#!/bin/bash

#########################################################################
#								       								    #
# Script de instalação do codeblocks     	                            #
# Autores: Samuel Novaes - samuel.moura@ccc.ufcg.edu.br					#
# Abril de 2017											       		#
#								       								    #
#########################################################################

#atualiza
apt-get update

#instala o repositorio
add-apt-repository ppa:damien-moore/codeblocks-stable

#atualiza e instala o codeblocks
apt-get update && apt-get install codeblocks
