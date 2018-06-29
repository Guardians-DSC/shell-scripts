# !/bin/bash

# atualiza
apt-get update -y

# faz o download do eclipse photon
wget http://mirror.nbtelecom.com.br/eclipse/technology/epp/downloads/release/photon/R/eclipse-jee-photon-R-linux-gtk-x86_64.tar.gz -O eclipse_photon.tar.gz

# deleta eclipse antigo
rm -rf /opt/eclipse

# extrai o arquivo em /opt
tar -zxvf eclipse_photon.tar.gz -C /opt/

# Cria entrada do eclipse na barra de ferramentas do sistema
echo -e "[Desktop Entry]\nVersion=1.0\nName=Eclipse Photon\nExec=/opt/eclipse/eclipse\nIcon=/opt/eclipse/icon.xpm\nType=Application\nCategories=Application" > /usr/share/applications/eclipse.desktop

#mv /usr/bin/eclipse /usr/bin/old-eclipse

#ln -s /opt/eclipse/eclipse /usr/bin/eclipse

# deleta o arquivo eclipse_photon.tar.gz
rm -rf eclipse_photon.tar.gz

