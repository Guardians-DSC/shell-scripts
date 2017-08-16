#!/bin/bash

paths=$(du -sh ~/* | sort -hr | zenity --list \
	--title "Diretorio/Arquivos" \
	--text "Selecione o que deseja excluir" \
	--width 640 \
	--height 480 \
	--column "#" \
	--column "Espaco - Arquivos" \
	--checklist \
	--separator " /")
