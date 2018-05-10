#!/bin/bash

get_percent() {
	
	if [ -e $file_user ]; then
		sed -i 4d $file_user
		sed -i 3d $file_user
		sed -i 2d $file_user
	else
		echo $limit_default > $file_user
	fi
	
	usado_m=$(quota -s | tail -1 | tr -s " " | cut -d " " -f2)
	total_m=$(quota -s | tail -1 | tr -s " " | cut -d " " -f3)
 	
 	lenght_usado=${#usado_m}
	lenght_total=${#total_m}
 	
 	isFull=$(echo $usado_m | grep "*")
 	
 	if [[ -n $isFull ]]; then
		usado_m=${usado_m:0:$lenght_usado}	
		percent=100	
	else	
		usado=${usado_m:0:$lenght_usado - 1}
		total=${total_m:0:$lenght_total - 1}
		
		percent=$(echo "scale=2; ($usado / $total) * 100" | bc | cut -d "." -f1)	
	fi

	echo $usado_m >> $file_user
	echo $total_m >> $file_user
	echo $percent >> $file_user	
	
}


user=$(whoami)
readonly limit_default=70
file_user="/home/$user/.infoCotaUser"
#---> linha 1 - limite para atingir o aviso
#---> linha 2 - cota usada
#---> linha 3 - cota total
#---> linha 4 - porcentagem




