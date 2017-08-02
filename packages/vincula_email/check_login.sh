#!/bin/bash

login=$(whoami)

if [ "$login" = "root" ] || [ "$login" = "guardians" ]; then
	exit
fi

file="/home/$login/.email_aluno"

if [ ! -f "$file" ]; then
	touch $file
fi

if [ -s "$file" ]; then
	exit
else
	gnome-terminal --maximize -e /opt/vincula_email/vincula_email.sh
fi
