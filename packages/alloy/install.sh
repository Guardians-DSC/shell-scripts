#!/bin/bash

#################################################################################################
#                                                                                                                                                                                       #
# Script de instala��o Alloy
                                                     # #
# Autores: Ana Godoy - godoyisadora@gmail.com      #
# Abril de 2017                                                                                                                                                       #
#                                                                                                                                                                                       #
#################################################################################################

#Update
apt-get -y update

#Install Java6
apt-get -y install software-properties-common python-software-properties
apt-get -y  update
apt-get -y install default-jre
apt-get -y install default-jdk
yes '' | add-apt-repository ppa:webupd8team/java
apt-get -y update
apt-get -y install oracle-java6-installer

#Download Alloy
wget http://alloy.mit.edu/alloy/downloads/alloy4.2.jar --output-document=alloy.jar

#Create soft link to  Alloy
mkdir /opt/alloy
mv alloy.jar /opt/alloy

touch /opt/alloy/alloy
echo  "#!/bin/bash" >> /opt/alloy/alloy
echo "java -jar /opt/alloy/alloy.jar" >> /opt/alloy/alloy
chmod +x /opt/alloy/alloy

from=/opt/alloy/alloy
to=/usr/local/bin
ln -s $from  $to

#Create Desktop Icon
cp ./desktop-icon/alloy.gif /opt/alloy/
cp ./desktop-icon/alloy.desktop /usr/share/applications/
