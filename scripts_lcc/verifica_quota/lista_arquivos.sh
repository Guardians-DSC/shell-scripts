#!/bin/bash

########################## FUNCTIONS ########################################################################################################

# Função criada para verificar o status atual da variavel $? e sair do script se for igual a 1
verifica_status() {
		case $? in
			1) exit ;;
		esac

}


# Função criada para deletar o arquivo .txt que salva as o caminho das pastas, caso ela já exista
deletar_arquivo_antigo() {
	if [ -s $arquivos_analisados ]; then
	rm $arquivos_analisados $arquivos_ordenados
	fi

}


# Função criada para calcular o tamanho das pastas que recebe como paramentro e salvar em um arquivo.txt
analisar_pastas() {
	textos=("Área de Trabalho" 
			"Área de Trabalho (Ocultos)" 
			"Downloads" 
			"Documentos" 
			"Imagens" 
			"Vídeos" 
			"Lixeira" 
			"Cache" 
			"Configurações")
	
	for ((i = 0; i < ${#textos[*]}; i++)); do
		$(for j in $1; do
			du -sh "$j" 2>/dev/null | tee -a $arquivos_analisados
		  done) | zenity --progress \
				--text="Verificando Arquivos e Pastas em  --  ${textos[$i]}  --" \
				--pulsate \
				--auto-close \
				--width 500
				
		verifica_status
		shift
	done
	
	# Ordena os arquivos pelo tamanho e atribui linhas a cada um
	cat $arquivos_analisados | sort -hr | nl > $arquivos_ordenados
	verifica_status
	
}


# Função criada para exibir os arquivos e pastas analisados
mostrar_arquivos_pastas() {
	while true; do
	
		chosen_file=$(cat $arquivos_ordenados | zenity  --list \
				--title "Arquivos/Pastas" \
				--text "- Selecione o(s) arquivo(s) ou pasta(s) que deseja excluir" \
				--width 640 \
				--height 580 \
				--cancel-label "Voltar" \
				--ok-label "Excluir" \
				--column "    #  -  Tamanho  -  Arquivos/Pastas" \
				--separator " /home")
		
		verifica_status
		confirmacao=$(confirmar_exclusao_arquivos)
	
		if [[ "$confirmacao" == "true" ]]; then
			excluir_arquivo $chosen_file
		fi
	done

}


# Função criada para confirmar se o usuario quer mesmo excluir o arquivo
confirmar_exclusao_arquivos() {
	zenity --question \
		--title="Aviso" \
		--text="Tem certeza que desejar excluir?" \
		--no-wrap \
		--default-cancel \
		--cancel-label "Não" \
		--ok-label "Sim"
			
	case $? in
		0) echo "true" ;;
	esac
	
}


# Função criada para escluir o arquivo recebido
excluir_arquivo() {
	line_file=$1 # Primeiro Parametro recebido é a linha do arquivo a ser deletado
	shift; shift # Remove o primeiro e segundo parametros que são a linha e tamanho do arquivos
	file_received=$* # Atribui dos os parametros recebidos na variavel
	
	$(rm -Rf "$file_received" && sed -i ${line_file}d $arquivos_ordenados) | zenity \
		--progress \
		--text="Excluindo Arquivo/Pasta..." \
		--pulsate \
		--auto-close \
			
	verifica_status

}


# Função Main do script
main_lista_arquivos() {
	deletar_arquivo_antigo
	analisar_pastas "$home_user_all" \
					"$home_user_ocult" \
					"$downloads_user" \
					"$documentos_user" \
					"$imagens_user" \
					"$xvideos_user" \
					"$lixeira_user" \
					"$cache_user" \
					"$config_user"
	
	mostrar_arquivos_pastas

}

########################## MAIN #############################################################################################################

# Declaração de variaveis globais do script
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
arquivos_analisados="/tmp/arquivosCarregados.txt"
arquivos_ordenados="/tmp/arquivosOrdenados.txt"

main_lista_arquivos
