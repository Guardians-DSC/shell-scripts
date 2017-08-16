#!/bin/bash

user=$(whoami)

files=$(du -sh /home/$user/* /home/$user/.??* 2>/dev/null | sort -hr | zenity --list \
	--title "Diretorio/Arquivos" \
	--text "Selecione o que deseja excluir" \
	--width 640 \
	--height 480 \
	--column "#" \
	--column "Espaco - Arquivos" \
	--checklist \
	--separator " /")

for file in $files; do
	echo $("$file" | grep "/home/")
done
