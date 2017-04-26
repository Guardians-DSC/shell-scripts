#!/bin/bash

#########################################################################
#								       								#
# Script de instalação do Spotify  	#
# Autores: Tainah Emmanuele - tainahemmanuele@gmail.com e Victor Hugo - victorhundo@gmail.com 							#
# Janeiro de 2017											       		#
#								       								#
#########################################################################

#Adiciona o repositorio
sh -c "echo 'deb http://repository.spotify.com stable non-free' >> /etc/apt/sources.list.d/spotify.list"

#Atualiza os repositorios
apt-get update

#Instala o spotify
apt-get install spotify-client
