#!/bin/bash


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

create_mount_point(){
	login=$(whoami)
	mount_point="/home/$login/montagem-emails"
	if [ -e "$mount_point" ]; then
		fusermount -u $mount_point
		rm -r $mount_point
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
		
#		[ $? -eq 255 ] && exit


                if [ "$email_valido" = "ok" ]; then
                        break
                else
                        msg_box "Email invalido -- @ccc.ufcg.edu.br -- requerido"
                fi

        done

	email_confirm=$(input_email "Digite novamente seu email:")
#	[ $? -eq 255 ] && exit 
		
	if [ "$email" = "$email_confirm" ]; then
		usuario_ok="true"
		break
	else
		msg_box "Os emails informados nao sao identicos, digite novamente"
	fi
done

while true; do
	password=$(dialog --stdout --no-cancel --ok-label "Ok" --title "Senha" --passwordbox "Poderia inserir a senha de seu usuario-LCC?" 0 0)
	login=$(whoami)
	path_log="/home/$login/log_vincula_email"
	rm $path_log
	sshpass -p $password ssh -p 23456 $login@chopper.lcc.ufcg.edu.br exit 2>$path_log
	permission_denied=$(cat $path_log | grep "denied")
	
	if [ -n "$permission_denied" ]; then
		msg_box "Ops, senha incorreta! :("
	else
		rm $path_log
		break
	fi
done


if [ "$usuario_ok" = "true" ]; then
	create_mount_point
	path_server="/opt/emails_cadastrados"
	path_local="/home/$login/montagem-emails"
	file_local="$path_local/usuarios_cadastrados.csv"
	
	echo $password | sshfs -p 23456 $login@chopper.lcc.ufcg.edu.br:$path_server $path_local -o password_stdin
	echo $login,$email >> $file_local
	
	password=""
	fusermount -u $path_local
	rmdir $path_local
fi
msg_box "Obrigado :)"
exit
