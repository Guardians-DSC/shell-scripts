#!/bin/bash

valida_email() {
	regex=^[a-z]+\\.[a-z]+@"ccc.ufcg.edu.br"
	email=$1

	if [[ $email =~ $regex ]]; then  
        	echo "ok"
	else
        	echo "not ok"
	fi  
}


msg_box() {
	dialog \
	--ok-label "Ok" \
	--msgbox "$*" \
	0 0 
}


input_email() {
	dialog \
	--stdout \
	--trim \
	--no-cancel \
	--ok-label "Ok" \
	--clear \
	--title "Email" \
	--inputbox "\n$*" \
	0 0
}

usuario_ok="false"
msg_box "Gostariamos de vincular sua conta do LCC ao email do curso, poderia nos informar o seu email @ccc...?"
while true; do
	while true; do
		email=$(input_email "Digite seu email:")
		email_valido=$(valida_email $email)
		
		if [ "$email_valido" = "ok" ]; then
			break
		else
			msg_box "Email invalido -- @ccc.ufcg.edu.br -- requerido"
		fi
	done	
	email_confirm=$(input_email "Digite novamente seu email:")
 		
	if [ "$email" = "$email_confirm" ]; then
		usuario_ok="true"
		break
	else
		msg_box "Os emails informados não sao identicos, digite novamente"
	fi
	
	[ $? -eq 255 ] && break
done
msg_box "Obrigado :)" && clear

if [ "$usuario_ok" = "true" ]; then
	arq_csv="/opt/user_check/usuarios_cadastrados.csv"
	login=$(whoami)
	echo "$login","$email" >> $arq_csv
fi
