#/bin/bash
#################################################################################################
#								       															                                             #
# Script de instalação do Oracle Database Express Edition 11g 	       							             #
# Autores: Victor Hugo - victorhundo@gmail.comaa                                                 #
# Janeiro de 2017											       								                                     #
#								       															                                             #
#################################################################################################

USER="oracle"
PASSWORD="secret"
ORACLE_HTTP_PORT="9000"
ORACLE_LISTENER_PORT="1521"
ORACLE_PASSOWRD="secretdb"
ORACLE_DEB="http://psi.splab.ufcg.edu.br/oracle-xe_11.2.0-2_amd64.deb"

#instalando depedencias
apt-get update && apt-get install -y $(cat depedences) && rm -rf /var/lib/apt/lists/*

# Atualização da configuração dos usuários do sistema
addgroup oinstall
addgroup dba
addgroup nobody
usermod -g nobody nobody
useradd -g oinstall -G dba -p $PASSWORD -d /home/$USER -s /bin/bashuseradd -g oinstall -G dba -p $PASSWORD -d /home/$USER -s /bin/bash  $USER
echo $USER:$PASSWORD | chpasswd
mkdir /home/$USER
chown -R $USER:dba /home/$USER
addgroup $USER oinstall
addgroup $USER dba
addgroup $USER nobody

#Criando links simbólicos
ln -s /usr/lib/i386-linux-gnu/libpthread_nonshared.a /usr/lib
ln -s /usr/lib/i386-linux-gnu/libc_nonshared.a /usr/lib
ln -s /lib/i386-linux-gnu/libgcc_s.so.1 /lib
ln -s /usr/lib/i386-linux-gnu/libstdc++.so.6 /usr/lib
ln -s /usr/bin/awk /bin/awk
ln -s /usr/bin/rpm /bin/rpm
ln -s /usr/bin/basename /bin/basename
mkdir /etc/rc.d
for i in 0 1 2 3 4 5 6 S ; do ln -s /etc/rc$i.d /etc/rc.d/rc$i.d ; done

#Criando diretórios exigidos pelo Oracle
mkdir -p /u01/app/oracle
chown -R $USER:dba /u01

#Atualizando as configurações
cp ./conf/chkconfig /sbin/
chmod 755 /sbin/chkconfig

cat ./conf/sysctl.conf >> /etc/sysctl.conf
cat ./conf/limits.conf >> /etc/security/limits.conf

cp ./conf/oracle-shm /etc/init.d/oracle-shm
chmod 755 /etc/init.d/oracle-shm
/etc/init.d/oracle-shm start

update-rc.d oracle-shm defaults 01 99

#Baixando e instalando o Oracle
wget $ORACLE_DEB  --output-document=oracle.deb
dpkg --install oracle.deb
#dpkg --install oracle-xe_11.2.0-2_amd64.deb

#Configurando Oracle
cp ./conf/init.ora /u01/app/oracle/product/11.2.0/xe/config/scripts/
cp ./conf/initXETemp.ora /u01/app/oracle/product/11.2.0/xe/config/scripts/

cat ./conf/bashrc >> /etc/profile
source /etc/profile

mkdir /var/lock/subsys
touch /var/lock/subsys/oracle-xe
touch /var/lock/subsys/listener

printf "$ORACLE_HTTP_PORT\\n$ORACLE_LISTENER_PORT\\n$ORACLE_PASSOWRD\\n$ORACLE_PASSOWRD\\ny\\n" | /etc/init.d/oracle-xe configure
rm oracle.deb
