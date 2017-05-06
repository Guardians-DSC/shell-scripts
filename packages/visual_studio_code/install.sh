#!/bin/bash

#################################################################################################
#                                                                                                                                                                                       #
# Script de instala��   Visual Studio Code
                                                     # #
# Autores: Ana Godoy - godoyisadora@gmail.com      #
# Abril de 2017                                                                                                                                                       #
#                                                                                                                                                                                       #
#################################################################################################

wget https://go.microsoft.com/fwlink/?LinkID=760868

yes | apt-get update
yes | dpkg -i index.html?LinkID=760868; yes | apt-get -f install; yes| dpkg -i index.html?LinkID=760868

rm index.html?LinkID=760868
