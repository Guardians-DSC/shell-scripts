#!/bin/bash

readonly limit=10
aviso_usuario_bool="false"

usado_m=$(quota -s | tail -1 | tr -s " " | cut -d " " -f2)
total_m=$(quota -s | tail -1 | tr -s " " | cut -d " " -f3)

len_usado=${#usado_m}
len_total=${#total_m}

usado=${usado_m:0:$len_usado-1}
total=${total_m:0:$len_total-1}

percent=$(echo "scale=2; ($usado / $total) * 100" | bc | cut -d "." -f1)

if [[ $percent -ge $limit ]]; then
	./aviso_usuario.sh "true"
fi
