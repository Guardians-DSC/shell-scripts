#!/bin/bash

###################### AVISO ####################################
																#
# NECESSÁRIO TER INSTALADO:										#
#---> yad														#
#---> zenity													#
#---> quota														#
																#
###################### AVISO ####################################


path_atual=$(dirname $0)
path_verifica_quota="$path_atual/verifica_quota.sh"
path_lista_arquivos="$path_atual/lista_arquivos.sh"
local_imgs="$path_atual/graficoUso"

source $path_verifica_quota "not logging"
source $path_lista_arquivos


########################## FUNCTIONS ########################################################################################################

verifica_status_aviso_usuario() {
	
	case $? in
		
		0) exit & main_lista_arquivos ;;
		
		1) exit ;;
		
		2) exit & limpar_lixeira ;;
		
		3) exit & apagar_cache ;;
		
		4) exit & alterar_limite ;;
		
		5) exit & reportar_bug ;;

	esac
}


limpar_lixeira() {
	empty_dir=$(mktemp -d)
	$(rsync -r --delete $empty_dir/ $lixeira_user) | zenity \
		--progress \
		--text="Excluindo Arquivo/Pasta..." \
		--pulsate \
		--auto-close && zenity \
		--info \
		--title="Aviso" \
		--text="Lixeira Limpa com Sucesso."; exit & main_aviso_usuario
}


apagar_cache() {
	yad --question \
		--center \
		--title="Aviso" \
		--text="<big>\n Tem certeza que deseja prosseguir?\n\n O Cache dos seus navegadores \n e outros programas serão deletados.</big>"
	
	case $? in
		
		0) $(empty_dir=$(mktemp -d); rsync -r --delete $empty_dir/ $cache_user) | zenity \
		--progress \
		--text="Excluindo Arquivo/Pasta..." \
		--pulsate \
		--auto-close && zenity \
		--info \
		--text="Cache Deletado com Sucesso." \
		--title="Aviso"; exit & main_aviso_usuario ;;
		
		1) exit & main_aviso_usuario ;;
	
	esac
}


alterar_limite() {
	
	new_limit=$(yad --scale \
		--title="Novo Limite" \
		--center \
		--width 400 \
		--height 150 \
		--value=$limit \
		--min-value=1 \
		--inc-buttons )
	
	case $? in
		
		0) sed -i "1s/.*/$new_limit/" $file_user ; exit & main_aviso_usuario ;;
		
		1) exit & main_aviso_usuario ;;
	
	esac
	
}

reportar_bug() {
	bug=$(zenity --entry \
		--title="Informe o problema" \
		--width 400 \
		--height 200 \
		--ok-label="Enviar" \
		--cancel-label="Voltar" )
	
	case $? in
		
		0) ;;
		
		1) exit & main_aviso_usuario ;;
	
	esac

}


update_percent_aviso_usuario() {
	get_percent

	limit=$(sed -n 1p $file_user)
	usado_m=$(sed -n 2p $file_user)
	total_m=$(sed -n 3p $file_user)
	percent=$(sed -n 4p $file_user)


	if [[ $percent -ge $limit ]]; then
		aviso_excedeu="<big><big><big> $user</big><b> você está utilizando mais de $limit% \n da sua cota de disco atual!</b></big></big> \n\n"
	else
		aviso_excedeu=""
	fi
}



main_aviso_usuario() {
	update_percent_aviso_usuario
	icon_guardians="$path_atual/guardians.png"
	graph="$local_imgs/$percent"_usado.png
	aviso_cota_total="<big><b>- Cota Total: </b></big><big>$total_m</big> \n\n"
	aviso_cota_usada="<big><b>- Cota Utilizada: </b></big><big>$usado_m</big> \n\n\n"
	text_inform_1="<big>Você pode clicar no botão <i>Analisar Todos os Arquivos</i> \n para excluir algum arquivo ou pasta que esteja \n ocupando muito espaço.</big> \n\n"
	text_inform_2="<big>Se quiser também, pode clicar em <i>Apagar Lixeira</i>\n ou <i>Apagar Cache</i>. Para deletar os arquivos da\n Lixeira ou Cache (Google Chrome, Firefox...).</big>\n\n"
	text_inform_3="<big>Se deseja mudar o limite em % para que essa\n mensagem apareça, clique em <i>Alterar Limite</i>.</big>"
	
	yad --form \
	--title="Aviso - Guardians" \
	--width 1100 \
	--height 375 \
	--center \
	--fixed \
	--window-icon "$icon_guardians" \
	--image "$graph" \
	--text="$aviso_excedeu $aviso_cota_total $aviso_cota_usada $text_inform_1 $text_inform_2 $text_inform_3" \
	--button="<b>Analisar Todos os Arquivos</b>":0 \
	--button="<b>Limpar Lixeira</b>":2 \
	--button="<b>Limpar Cache</b>":3 \
	--button="<b>Alterar Limite</b>":4 \
	--button=gtk-quit:1 \
	# --button="<b>Reportar um Bug</b>":5 \
	
	
	verifica_status_aviso_usuario
}

########################## END FUNCTIONS ########################################################################################################

user=$(whoami)
home_user="/home/$user"
lixeira_user="$home_user/.local/share/Trash/files/"
cache_user="$home_user/.cache/"
file_user="/home/$user/.infoCotaUser"

limit=""
usado_m=""
total_m=""
percent=""
aviso_excedeu=""

main_aviso_usuario
