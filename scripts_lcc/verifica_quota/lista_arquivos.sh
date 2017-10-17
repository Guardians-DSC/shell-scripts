#!/bin/bash

user=$(whoami)
home_user="/home/$user"
downloads_user="$home_user/Downloads"
documentos_user="$home_user/Documentos"
imagens_user="$home_user/Imagens"
videos_user="$home_user/Videos"
lixeira_user="$home_user/.local/share/Trash/files"
	
escolhido=$(du -sh $downloads_user/* $documentos_user/* $imagens_user/* $videos_user/* $lixeira_user/* $home_user/* $home_user/.??* 2>/dev/null | sort -hr | zenity  --list \
			--title "Arquivos/Pastas" \
			--text "Selecione o(s) arquivo(s) ou pasta(s) que deseja excluir" \
			--width 640 \
			--height 580 \
			--column "Tamanho  -  Arquivos/Pastas" \
			--separator " /home")

cont=0
file=""
for string in $escolhido; do
	if [[ $cont -eq 1 ]]; then
		file+=$string
	elif [[ $cont -gt 1 ]]; then
		file+="\ "$string
	fi
	cont=$cont+1
done
echo $file
rm -f $file
