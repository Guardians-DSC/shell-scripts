#!/bin/bash

#############################################

# Autor: Samuel Novaes de Moura - 09/08/2017

#############################################

quota_ocupada=$(quota -s | tail -1 | grep "*")

if [ -n "$quota_ocupada" ]; then
gnome-terminal --geometry=60x24+1455+0 -e 'dialog --title "Mensagem - Guardians" --no-shadow --ok-label "Ok" --msgbox " Sua cota de espaco foi excedida :( \n Para verificar quais arquivos e diretorios estao ocupando mais espaco, execute no terminal os seguintes comandos: \n  --> du -sh ~/* \n  --> du -sh ~/.??* \n O primeiro comando exibe os seus arquivos e o segundo comando exibe os arquivos ocultos. Os arquivos ocultos contem as configuracoes da sua conta e dos seus aplicativos, os arquivos em cache e a lixeira da sua conta. \n Para remover o cache dos navegadores, execute os seguintes comandos: \n  --> rm -Rf ~/.cache/google-chrome/Cache \n  --> rm -Rf ~/.mozilla/firefox/*/Cache \n  --> rm -Rf ~/.cache/mozilla/firefox/*/Cache \n Para apagar a lixeira de sua conta, execute o seguinte comando: \n  --> rm -Rf ~/.local/share/Trash/files/*" 0 0'
fi

