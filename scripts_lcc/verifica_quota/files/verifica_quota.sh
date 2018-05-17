#!/bin/bash


########################## FUNCTIONS ########################################################################################################

get_percent() {
	
	if [ -e $file_user ]; then
		sed -i '2,$d' $file_user # apaga todas as linhas de informações, exceto o limite que precisa atingir, para que o usuario seja avisado 
	else
		echo $limit_default > $file_user # caso o arquivo que contém as informações não seja encontrado, é criado um novo 
	fi
	
	usado_m=$(quota -s -u $user | tail -1 | tr -s " " | cut -d " " -f2) # variável que armazena a quantidade de cota utilizada com a letra M ( megabytes )
	total_m=$(quota -s -u $user | tail -1 | tr -s " " | cut -d " " -f3) # variável que armazena a quantidade de cota total do usuario com a letra M ( megabytes )
 	
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


check_quota_on_login() {
	# verifica se a cota usada do usuário ultrapassou o limite imposto
	
	path_atual=$(dirname $0)
	path_aviso_usuario="$path_atual/aviso_usuario.sh"
	
	get_percent

	limit=$(sed -n 1p $file_user) #--> linha 1 - limite de cota utilizada 
	usado_m=$(sed -n 2p $file_user) #--> linha 2 - cota usada
	total_m=$(sed -n 3p $file_user) #--> linha 3 - cota total
	percent=$(sed -n 4p $file_user) #--> linha 4 - porcentagem da cota utilizada

	if [[ $percent -ge $limit ]]; then
		sleep 7s; $path_aviso_usuario
	fi

}

########################## END FUNCTIONS ########################################################################################################

if [[ -z $DISPLAY ]]; then
	exit;
fi

user=$(whoami)
limit_default=70

file_user="/home/$user/.infoCotaUser" # -----|
# Informações do arquivo:					 |
#--> linha 1 - limite de cota utilizada 	 |
#--> linha 2 - cota usada					 |
#--> linha 3 - cota total					 |
#--> linha 4 - porcentagem da cota utilizada |				
#------------------------------------------- |
 
if [[ "$1" == "logging" ]]; then # se o script for executado com o parametro 'logging', então irá chamar a função check_quota_on_login()
	check_quota_on_login
fi



