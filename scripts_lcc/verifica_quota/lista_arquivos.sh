#!/bin/bash

user=$(whoami)
home_user="/home/$user"
downloads_user="$home_user/Downloads"
documentos_user="$home_user/Documentos"
imagens_user="$home_user/Imagens"
videos_user="$home_user/Videos"
lixeira_user="$home_user/.local/share/Trash/files"
cache_user="$home_user/.cache"
config_user="$home_user/.config"


while true; do
	
	escolhido=$(du -sh $downloads_user/* $documentos_user/* $imagens_user/* $videos_user/* $lixeira_user/* $cache_user/* $config_user/* $home_user/* $home_user/.??* 2>/dev/null | sort -hr | zenity  --list \
			--title "Arquivos/Pastas" \
			--text "- Pode levar algum tempo para verificar os arquivos \n- Selecione o(s) arquivo(s) ou pasta(s) que deseja excluir" \
			--width 640 \
			--height 580 \
			--cancel-label "Voltar" \
			--column "Tamanho  -  Arquivos/Pastas" \
			--separator " /home")
	
	case $? in
		0) confirm_erase=$(zenity --question) ;;
		
		1) break ;;
	esac
	
	echo $confirm_erase
	
	if [[ $confirm_erase -eq 0 ]]; then
		
		file=
		cont=0
		for string in $escolhido; do
			if [[ $cont -eq 1 ]]; then
				file+=$string
			elif [[ $cont -gt 1 ]]; then
				file+=" "$string
			fi
			cont=$cont+1
		done

		rm -Rf "$file"
	fi
done
