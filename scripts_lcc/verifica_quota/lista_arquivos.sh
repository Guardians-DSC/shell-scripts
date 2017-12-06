#!/bin/bash

carregar_pastas() {
	textos=("Área de Trabalho" "Área de Trabalho (Ocultos)" "Downloads" "Documentos" "Imagens" "Vídeos" "Lixeira" "Cache" "Configurações")
	
	for ((i = 0; i < ${#textos[*]}; i++)); do
		$(for j in $1; do
			du -sh $j 2> /dev/null | tee -a $arquivos_carregados
		  done) | zenity --progress \
				--text="Verificando Arquivos e Pastas em  --  ${textos[$i]}  --" \
				--pulsate \
				--auto-close \
				--width 500
		shift
	done
	
	if [ $? -eq 1 ]; then
		exit
	fi
	
}


excluir_arquivo() {
	file=""
	cont=0
	
	for string in $*; do
		if [[ $cont -eq 1 ]]; then
			file+=$string
		elif [[ $cont -gt 1 ]]; then
			file+=" "$string
		fi
		cont=$cont+1
	done

	rm -Rf "$file" | zenity --progress --text="Excluindo..." --pulsate --auto-close
	#sed -i '/$escolhido/d' $arquivos_carregados
		
}

user=$(whoami)
home_user="/home/$user"
home_user_all="$home_user/*"
home_user_ocult="$home_user/.??*"
downloads_user="$home_user/Downloads/*"
documentos_user="$home_user/Documentos/*"
imagens_user="$home_user/Imagens/*"
xvideos_user="$home_user/Videos/*"
lixeira_user="$home_user/.local/share/Trash/files/*"
cache_user="$home_user/.cache/*"
config_user="$home_user/.config/*"
arquivos_carregados="/tmp/arquivosCarregados.txt"


if [ -s $arquivos_carregados ]; then
	rm $arquivos_carregados
fi

carregar_pastas "$home_user_all" "$home_user_ocult" "$downloads_user" "$documentos_user" "$imagens_user" "$xvideos_user" "$lixeira_user" "$cache_user" "$config_user"

while true; do
	
	escolhido=$(cat $arquivos_carregados | sort -hr | zenity  --list \
			--title "Arquivos/Pastas" \
			--text "- Selecione o(s) arquivo(s) ou pasta(s) que deseja excluir" \
			--width 640 \
			--height 580 \
			--cancel-label "Voltar" \
			--ok-label "Excluir" \
			--column "Tamanho  -  Arquivos/Pastas" \
			--separator " /home")
	
	case $? in
		1) break ;;
	esac
	
	zenity --question --text="Tem certeza que desejar excluir?"
	
	case $? in
		0) excluir_arquivo $escolhido ;;
	esac

done
