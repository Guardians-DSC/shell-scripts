#!/bin/bash

#############################################

# Autor: Samuel Novaes de Moura - 09/08/2017

#############################################

valida_email() {
	regex=^[a-z.]+@"ccc.ufcg.edu.br"
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

####################################################


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
		msg_box "Os emails informados nao sao identicos, digite novamente"
	fi
done

if [ "$usuario_ok" = "true" ]; then
	login=$(whoami)
	echo $login,$email >> /home/$login/.email_aluno
fi
msg_box "Obrigado :)"
exit
