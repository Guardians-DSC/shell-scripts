#!/bin/bash

#########################################################################
#								       								    #
# Script de instalação do Eclipse Neon	       	                        #
# Autor: Javan Lacerda 							#
# Abril de 2017											       		#
#								       								    #
#########################################################################

#Atualiza e instala dependencias
apt-get update && apt-get install $(cat depedences) && rm -rf /var/lib/apt/lists/*

#Faz donwload do eclipse
wget http://eclipse.c3sl.ufpr.br/technology/epp/downloads/release/neon/R/eclipse-jee-neon-R-linux-gtk-x86_64.tar.gz -O eclipse.tar.gz

#Descompacta e instala o eclipse em /opt/
tar -zxvf eclipse.tar.gz -C /opt/

#Renomeia pasta para o padrão
mv /opt/eclipse*/ /opt/eclipse

#Faz download do icone do eclipse
wget https://dl2.macupdate.com/images/icons128/11662.png -O /opt/eclipse/eclipse.png

#Cria entrada do eclipse na barra de ferramentas do sistema
echo -e '[Desktop Entry]\n Version=1.0\n Name=eclipse\n Exec=/opt/eclipse/eclipse\n Icon=/opt/eclipse/eclipse.png\n Type=Application\n Categories=Application' |  tee /usr/share/applications/eclipse.desktop

#Apaga arquivo de download
rm -rfv eclipse.tar.gz 
