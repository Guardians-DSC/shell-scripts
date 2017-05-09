#!/bin/bash

#################################################################################################
#                                                                                                                                                                                       #
# Script de instala��   Visual Studio Code
                                                     # #
# Autores: Ana Godoy - godoyisadora@gmail.com      #
# Abril de 2017                                                                                                                                                       #
#                                                                                                                                                                                       #
#################################################################################################

# wget https://go.microsoft.com/fwlink/?LinkID=760868
# mv index.html?LinkID=760868 code.deb

yes | apt-get update
yes | dpkg -i code.deb; yes | apt-get -f install; yes| dpkg -i code.deb

# rm code.deb
rm code.deb
