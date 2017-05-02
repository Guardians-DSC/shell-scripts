#!/bin/bash

#################################################################################################
#                                                                                                                                                                                       #
# Script de instalaï¿½ï¿NFS                                                         
                                                     # #
# Autores: Ana Godoy - godoyisadora@gmail.com      #
# Abril de 2017                                                                                                                                                       #
#                                                                                                                                                                                       #
#################################################################################################

#Update
apt-get -y update

#Install NFS
apt-get -y install nfs-kernel-server
apt-get -y update
apt-get -y install nfs-common

#https://www.digitalocean.com/community/tutorials/how-to-set-up-an-nfs-mount-on-ubuntu-16-04
