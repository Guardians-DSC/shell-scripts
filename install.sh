#!/bin/bash

PACKAGES=$(grep -v "^#" packages_list | grep -v "^$")

for PACKAGE in $PACKAGES; do
	RANDOM_COLOR=$(echo $(( (RANDOM % 6) + 1)))
	tput setaf $RANDOM_COLOR; echo "Instalando $PACKAGE...";
	cd packages/$PACKAGE && bash -x install.sh | grep "^+"
	cd ../../
done
tput setaf 7;