#!/bin/bash


valida_email() {
	regex=^[a-z.]+@"ccc.ufcg.edu.br"
	email=$1
	
	if = [ -z $email ]; then
		echo "not ok"
	elif [[ $email =~ $regex ]]; then  
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

input_password() {
	dialog \
	--stdout \
	--no-cancel \
	--ok-label "Ok" \
	--title "Senha" \
	--passwordbox "" \
	0 0
}

create_mount_point(){
	mount_point="/mnt/montagem-emails"
	if [ -e "$mount_point" ]; then
		fusermount -u $mount_point
		rm rmdir $mount_point
	else
		mkdir $mount_point
	fi
}

usuario_ok="false"
msg_box "Gostariamos de vincular sua conta do LCC ao email do curso, poderia nos informar o seu email @ccc...?"
while true; do
	while true; do
                email=$(input_email "Digite seu email:")
                email_valido=$(valida_email $email)
		
		[ $? -eq 255 ] && exit


                if [ "$email_valido" = "ok" ]; then
                        break
                else
                        $(msg_box "Email invalido -- @ccc.ufcg.edu.br -- requerido")
                fi

        done

	email_confirm=$(input_email "Digite novamente seu email:")
	[ $? -eq 255 ] && exit 
		
	if [ "$email" = "$email_confirm" ]; then
		usuario_ok="true"
		break
	else
		msg_box "Os emails informados nao sao identicos, digite novamente"
	fi
done
msg_box "Obrigado :)" && clear

if [ "$usuario_ok" = "true" ]; then
	create_mount_point
	path_server="/opt/emails_cadastrados"
	path_local="/mnt/montagem-emails"
	file_local="/mnt/montagem-emails/usuarios_cadastrados.csv"
	login=$(whoami)
	password=$(dialog --stdout --no-cancel --ok-label "Ok" --title "Senha" --passwordbox "" 0 0)

	echo $password | sshfs -p 23456 samuelndm@chopper.lcc.ufcg.edu.br:$path_server $path_local -o password_stdin
	echo $login,$email >> $file_local
	
	fusermount -u $path_local
	rmdir $path_local
fi	
