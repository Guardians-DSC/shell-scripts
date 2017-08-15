# !/bin/bash

# atualiza
apt-get update -y

# faz o download do eclipse oxygen
wget eclipse.c3sl.ufpr.br/technology/epp/downloads/release/oxygen/R/eclipse-jee-oxygen-R-linux-gtk-x86_64.tar.gz -O eclipse_oxygen.tar.gz

# deleta eclipse antigo
rm -rf /opt/eclipse

# extrai o arquivo em /opt
tar -zxvf eclipse_oxygen.tar.gz -C /opt/

# Cria entrada do eclipse na barra de ferramentas do sistema
echo -e "[Desktop Entry]\nVersion=1.0\nName=eclipse\nExec=/opt/eclipse/eclipse\nIcon=/opt/eclipse/icon.xpm\nType=Application\nCategories=Application" > /usr/share/applications/eclipse.desktop

#mv /usr/bin/eclipse /usr/bin/old-eclipse

#ln -s /opt/eclipse/eclipse /usr/bin/eclipse

# deleta o arquivo eclipse_oxygen.tar.gz
rm -rf eclipse_oxygen.tar.gz
