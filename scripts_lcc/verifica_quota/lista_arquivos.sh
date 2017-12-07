#!/bin/bash

########################## FUNCTIONS ########################################################################################################

verificar_pastas() {
	textos=("Área de Trabalho" "Área de Trabalho (Ocultos)" "Downloads" "Documentos" "Imagens" "Vídeos" "Lixeira" "Cache" "Configurações")
	
	for ((i = 0; i < ${#textos[*]}; i++)); do
		$(for j in $1; do
			du -sh "$j" 2>/dev/null | tee -a $arquivos_carregados
		  done) | zenity --progress \
				--text="Verificando Arquivos e Pastas em  --  ${textos[$i]}  --" \
				--pulsate \
				--auto-close \
				--width 500
				
				case $? in
					1) exit ;;
				esac
		shift
	done
	
	cat $arquivos_carregados
	
	if [ $? -eq 1 ]; then
		exit
	fi
	
}


# Função criada para escluir o arquivo recebido
excluir_arquivo() {
	line_file=$1
	shift; shift
	file_received=$*
	
	$(rm -Rf "$file_received") | zenity --progress --text="Excluindo Arquivo/Pasta..." --pulsate --auto-close
	sed -i '${line_file}d' $arquivos_carregados
	
	case $? in
		1) return 0 ;;
	esac
	
	#case $rm_status in
	#	0) zenity --info --text="Arquivo/Pasta deletado(a) com Sucesso!" --no-wrap ;;
		
	#	1) zenity --warning --text="Não foi possível excluir \n\nVerifique se o Arquivo/Pasta está aberto(a) ou \nsendo usado(a) no momento" --no-wrap ;;
	#esac
}


########################## FUNCTIONS ########################################################################################################


########################## MAIN #############################################################################################################

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

verificar_pastas "$home_user_all" "$home_user_ocult" "$downloads_user" "$documentos_user" "$imagens_user" "$xvideos_user" "$lixeira_user" "$cache_user" "$config_user"

while true; do
	
	chosen_file=$(cat $arquivos_carregados | sort -hr |  nl | zenity  --list \
			--title "Arquivos/Pastas" \
			--text "- Selecione o(s) arquivo(s) ou pasta(s) que deseja excluir" \
			--width 640 \
			--height 580 \
			--cancel-label "Voltar" \
			--ok-label "Excluir" \
			--column " #  -  Tamanho  -  Arquivos/Pastas" \
			--separator " /home")
	
	case $? in
		1) break ;;
	esac
	
	zenity --question --text="Tem certeza que desejar excluir?"
	
	case $? in
		0) excluir_arquivo $chosen_file ;;
	esac

done

########################## MAIN #############################################################################################################
