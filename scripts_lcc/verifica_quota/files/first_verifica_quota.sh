#!/bin/bash

if [[ -z $DISPLAY ]]; then
	exit;
fi


path_atual=$(dirname $0)
verifica_quota_path="$path_atual/verifica_quota.sh"
aviso_usuario_path="$path_atual/aviso_usuario.sh"

source $verifica_quota_path

get_percent

limit=$(sed -n 1p $file_user) #---> linha 1 - limite para atingir o aviso
usado_m=$(sed -n 2p $file_user) #---> linha 2 - cota usada
total_m=$(sed -n 3p $file_user) #---> linha 3 - cota total
percent=$(sed -n 4p $file_user) #---> linha 4 - porcentagem

if [[ $percent -ge $limit ]]; then
	sleep 7s; $aviso_usuario_path
fi
