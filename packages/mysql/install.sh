#!/bin/bash

#################################################################################################
#                                                                                                                                                                                       #
# Script de instalaçãoMysql                                                                                                                       # #
# Autores: Ana Godoy - godoyisadora@gmail.com      #
# Abril de 2017                                                                                                                                                       #
#                                                                                                                                                                                       #
#################################################################################################

#Update
apt-get -y update

#Install Apache
apt-get -y install apache2

#Install Mysql
apt-get -y install mysql
apt-get -y install mysql-server mysql-client
#mysql_secure_installation
apt-get -y install mysql-workbench
