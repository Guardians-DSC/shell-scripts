#!/bin/bash

user=$(whoami)
home_user="/home/$user"
downloads_user="$home_user/Downloads"
documentos_user="$home_user/Documentos"
imagens_user="$home_user/Imagens"
videos_user="$home_user/Videos"
lixeira_user="$home_user/.local/share/Trash/files"
	
escolhidos=$(du -sh $downloads_user/* $documentos_user/* $imagens_user/* $videos_user/* $lixeira_user/* $home_user/* $home_user/.??* 2>/dev/null | sort -hr | zenity  --list \
			--title "Arquivos/Pastas" \
			--text "Selecione o(s) arquivo(s) ou pasta(s) que deseja excluir" \
			--width 640 \
			--height 580 \
			--multiple \
			--column "Tamanho  -  Arquivos/Pastas" \
			--separator " /")

for file in $escolhidos; do
	if [[ "$file" =~ "/home/" ]]; then
		echo $file
		#rm -Rf $file
	fi
done
