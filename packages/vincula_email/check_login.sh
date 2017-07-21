#!/bin/bash

#csv_file="/tmp/usuarios_cadastrados.csv"

wget http://150.165.54.41/usuarios_cadastrados.csv -q /tmp/usuarios_cadastrados.csv

OLD_IFS=$IFS
IFS=","
	
LOGIN_USER=$(whoami)
USER_FOUND="false"

while read login email; do
	if [ "$LOGIN_USER" = "$login" ]; then
		USER_FOUND="true"
		break
	fi
done < usuarios_cadastrados.csv
	
IFS=$OLD_IFS
rm usuarios_cadastrados.csv

# se o usuario nao estiver no arquivo .csv, o script vincula_email é executado
if [ "$USER_FOUND" = "false" ]; then
	gnome-terminal --maximize -e ./vincula_email.sh
fi
