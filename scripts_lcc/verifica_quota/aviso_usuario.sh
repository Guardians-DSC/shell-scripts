#!/bin/bash

source lista_arquivos.sh

verifica_status_aviso_usuario() {
	
	case $? in
		
		0) main_lista_arquivos ;;
		
		1) exit ;;
		
		2) apagar_lixeira ;;
		
		3) apagar_cache ;;
		
		4) ;;

	esac
}

apagar_lixeira() {
	rm -Rf $lixeira_user && zenity --info --text="Lixeira Deletada com Sucesso."; main_aviso_usuario
}

apagar_cache() {
	yad --question \
		--text="<big>\n Tem certeza que deseja prosseguir?\n\n O Cache dos seus navegadores \n e outros programas serão deletados.</big>"
	
	case $? in
		
		0) rm -Rf $cache_user && zenity --info --text="Cache Deletado com Sucesso."; main_aviso_usuario ;;
		
		1) main_aviso_usuario ;;
	
	esac
}




main_aviso_usuario() {
	graph="$local_imgs/$percent"_usado.png
	img_guardians="guardians2.jpg"
	icon_guardians="guardiansIcon.jpg"
	aviso_principal="<big><big><big> $user</big><b> você está utilizando mais de $limit% \n da sua cota de disco atual</b></big></big>"
	aviso_cota_total="<big><b>- Cota Total: </b></big><big>$total_m</big>"
	aviso_cota_usada="<big><b>- Cota Utilizada: </b></big><big>$usado_m</big>"
	text_inform_1="<big>Você pode clicar no botão <i>Analisar Todos os Arquivos</i> \n para excluir algum arquivo ou pasta que esteja \n ocupando muito espaço.</big>"
	text_inform_2="<big>Se quiser também, pode clicar em <i>Apagar Lixeira</i>\n ou <i>Apagar Cache</i>. Para deletar os arquivos da\n Lixeira ou Cache (Google Chrome, Firefox...).</big>"
	
	yad --form \
	--title="Aviso - Guardians" \
	--window-icon "$icon_guardians" \
	--width 1100 \
	--height 375 \
	--center \
	--fixed \
	--image "$graph" \
	--text="$aviso_principal \n\n  $aviso_cota_total \n\n $aviso_cota_usada \n\n\n $text_inform_1 \n\n $text_inform_2" \
	--button="<b>Analisar Todos os Arquivos</b>":0 \
	--button="<b>Limpar Lixeira</b>":2 \
	--button="<b>Limpar Cache</b>":3 \
	--button=gtk-quit:1 
	
	
	verifica_status_aviso_usuario
}

# Necessario ter instalado:
# - Yad
# - Zenity
# - quota

cota_ultrapassou=$1
user=$(whoami)
home_user="/home/$user"
lixeira_user="$home_user/.local/share/Trash/files/*"
cache_user="$home_user/.cache/*"
local_imgs="graficoUso"


if [[ "$cota_ultrapassou" == "true" ]]; then
	main_aviso_usuario
fi
