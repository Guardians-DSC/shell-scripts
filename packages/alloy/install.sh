#################################################################################################
#                                                                                                                                                                                       #
# Script de instalaço Alloy                                                           
                                                     # #
# Autores: Ana Godoy - godoyisadora@gmail.com      #
# Abril de 2017                                                                                                                                                       #
#                                                                                                                                                                                       #
#################################################################################################

#Update
apt-get -y update

#Install Java6
apt-get -y install python-software-properties
add-apt-repository ppa:webupd8team/java
apt-get -y update
apt-get -y install oracle-java6-installer

#Download Alloy
wget http://alloy.mit.edu/alloy/downloads/alloy4.2.jar

#Install Alloy

