#!/bin/bash

# variavel com o PATH do CSV
file="/opt/user_check/usuarios_cadastrados.csv"

# checa se o arquivo existe, se não, é criado um arquivo CSV com a coluna "login" e "email"
#if [ ! -e "$file" ]; then
#	echo "login,email" > $file
#	chmod 777 usuarios_cadastrados.csv
#fi

# salvando o separador atual em uma variavel
OLD_IFS=$IFS

# atribuindo a virgula como novo separador
IFS=","
	
# salvando na variavel o usuario logado no momento
LOGIN_USER=$(whoami)

# variavel para definir se o usuario foi encontrado ou não
USER_FOUND="false"

# lendo as linhas da coluna 'login' no arquivo CSV 
while read login email; do

	# verifica se o login do usuario atual esta contido no arquivo CSV
	if [ "$LOGIN_USER" = "$login" ]; then
		USER_FOUND="true"
		break
	fi
done < $file
	
IFS=$OLD_IFS

# se o usuario ainda nao cadastrou o email, executa o script de vinculacao do email
if [ "$USER_FOUND" = "false" ]; then
	gnome-terminal --maximize -e /opt/user_check/vincula_email.sh
fi
