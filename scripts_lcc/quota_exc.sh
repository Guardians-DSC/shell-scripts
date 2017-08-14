#!/bin/bash

#############################################

# Autor: Samuel Novaes de Moura - 09/08/2017

#############################################

quota_ocupada=$(quota -s | tail -1 | grep "*")

if [ -n "$quota_ocupada" ]; then
	gnome-terminal --geometry=50x15+1455+0 -e 'dialog --title "Mensagem - Guardians" --no-shadow --ok-label "Ok" --msgbox "Sua cota de espaco foi excedida :( \nPara verificar quais arquivos e diretorios estao ocupando mais espaco, execute no terminal os seguintes comandos: \n - du -sh ~/* \n - du -sh ~/.??* \nO primeiro comando exibe os seus arquivos e o segundo comando exibe os arquivos ocultos. Os arquivos ocultos contem as configuracoes da sua conta e dos seus aplicativos, os arquivos em cache e a lixeira da sua conta." 0 0'
fi

