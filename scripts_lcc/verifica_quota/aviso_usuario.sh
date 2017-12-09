#!/bin/bash

source lista_arquivos.sh

verifica_status_aviso_usuario() {
	
	case $? in
		
		0) main_lista_arquivos ;;
		
		1) exit ;;
	esac
}


main_aviso_usuario() {
	graph="$local_imgs/$percent"_usado.png
	img_guardians="guardians2.jpg"
	icon_guardians="guardiansIcon.jpg"
	aviso_principal="<big><big><b><big> $user</big> sua cota de espaço está \n chegando no limite </b></big></big>"
	aviso_cota_total="<big><b>- Cota Total: </b></big><big>$total M</big>"
	aviso_cota_usada="<big><b>- Cota Utilizada: </b></big><big>$usado M </big>"
	text_inform="<big>Você pode clicar no botão <i>Analisar Todos os Arquivos</i> \n para excluir algum arquivo ou pasta que esteja \n ocupando muito espaço</big>"
	
	yad --form \
	--title="Aviso - Guardians" \
	--window-icon "$icon_guardians" \
	--width 1100 \
	--height 375 \
	--center \
	--fixed \
	--image "$graph" \
	--text="$aviso_principal \n\n  $aviso_cota_total \n\n $aviso_cota_usada \n\n\n $text_inform" \
	--button="<b>Analisar Todos os Arquivos</b>":0 \
	--button=gtk-quit:1
	
	verifica_status_aviso_usuario
}

# Necessario ter instalado:
# - Yad
# - Zenity
# - quota

user=$(whoami)
local_imgs="graficoUso"
limit=70

usado=70
total=100
percent=$(echo "scale=2; ($usado / $total) * 100" | bc | cut -d "." -f1)

case $percent in
	$limit) main_aviso_usuario ;;

esac
