#!/bin/bash

# baixa
wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
# extrai os arquivos em /opt
sudo tar -xzf postman.tar.gz -C /opt
# remove o arquivo .gz baixado
rm postman.tar.gz
# cria o alias
sudo ln -s /opt/Postman/Postman /usr/bin/postman

# cria a entrada do postman na barra de ferramentas
cat > /usr/share/applications/postman.desktop <<EOL
[Desktop Entry]
Encoding=UTF-8
Name=Postman
Exec=postman
Icon=/opt/Postman/resources/app/assets/icon.png
Terminal=false
Type=Application
Categories=Development;
EOL
