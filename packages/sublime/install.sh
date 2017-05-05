#!/bin/bash

#################################################################################################
#                                                                                                                                                                                       #
# Script de instala��o Sublime                                                        
                                                     # #
# Autores: Ana Godoy - godoyisadora@gmail.com      #
# Abril de 2017                                                                                                                                                       #
#                                                                                                                                                                                       #
#################################################################################################

#Update
apt-get -y update

#Install Sublime
apt-get -y install software-properties-common python-software-properties
apt-get -y  update
yes '' | add-apt-repository ppa:webupd8team/sublime-text-3
apt-get -y update
apt-get -y install sublime-text-installer

ln -s /opt/sublime_text/sublime_text /usr/local/bin/subl

