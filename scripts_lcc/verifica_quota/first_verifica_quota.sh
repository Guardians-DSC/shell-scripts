#!/bin/bash

if [[ -z $DISPLAY ]]; then
	exit;
fi


path_atual=$(dirname $0)
verifica_quota_path="$path_atual/verifica_quota.sh"
aviso_usuario_path="$path_atual/aviso_usuario.sh"

source $verifica_quota_path

get_percent

limit=$(sed -n 1p $file_user)
usado_m=$(sed -n 2p $file_user)
total_m=$(sed -n 3p $file_user)
percent=$(sed -n 4p $file_user)

if [[ $percent -ge $limit ]]; then
	sleep 5s; $aviso_usuario_path
fi
