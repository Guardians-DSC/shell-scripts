#!/bin/bash

#################################################################################################
#                                                                                                                                                                                       #
# Script de instalação Python-tk
                                                     # #
# Autores: Ana Godoy - godoyisadora@gmail.com      #
# Abril de 2017                                                                                                                                                       #
#                                                                                                                                                                                       #
#################################################################################################

#Update
apt-get -y update

#Install Python 2 and 3
apt-get -y install python2.7
apt-get -y install python3 


#Install Python-tk
apt-get -y install python-tk
from Tkinter import *
apt-get -y update
apt-get -y install python3-tk

