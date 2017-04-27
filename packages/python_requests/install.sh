#!/bin/bash

#################################################################################################
#                                                                                                                                                                                       #
# Script de instalaço  Python 2                                                                                                                        # #
# Autores: Ana Godoy - godoyisadora@gmail.com      #
# Abril de 2017                                                                                                                                                       #
#                                                                                                                                                                                       #
#################################################################################################

#Update
apt-get -y update

#Install Python-Requests
apt-get -y install python-requests

#Update
apt-get -y upgrade python-requests
