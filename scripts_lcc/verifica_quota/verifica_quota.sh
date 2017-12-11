#!/bin/bash

get_percent() {
	user=$(whoami)
	readonly limit_default=70
	file_user="/home/$user/.infoCotaUser"
	# 1 linha - limite para atingir o aviso
	# 2 linha - cota usada
	# 3 linha - cota total
	# 4 linha - porcentagem
	
	if [ -e $file_user ]; then
		sed -i 4d $file_user
		sed -i 3d $file_user
		sed -i 2d $file_user
	else
		echo $limit_default > $file_user
	fi

	usado_m=$(quota -s | tail -1 | tr -s " " | cut -d " " -f2)
	total_m=$(quota -s | tail -1 | tr -s " " | cut -d " " -f3)
	echo $usado_m >> $file_user
	echo $total_m >> $file_user

	len_usado=${#usado_m}
	len_total=${#total_m}

	usado=${usado_m:0:$len_usado-1}
	total=${total_m:0:$len_total-1}

	percent=$(echo "scale=2; ($usado / $total) * 100" | bc | cut -d "." -f1)
	echo $percent >> $file_user	
	
}








