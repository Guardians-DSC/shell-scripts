#!/bin/bash

#########################################################
#                                                       #
# author: pedro lira - pedulira@gmail.com               #
#                                                       #
#########################################################

### update repositories
apt-get update

mkdir webstorm

### download webstorm package
wget https://download.jetbrains.com/webstorm/WebStorm-2017.1.2.tar.gz --output-document=ws.tar.gz

### extract downloaded package to a temporary folder
tar -xzvf ws.tar.gz -C ./webstorm/

### moving package to /opt
mv ./webstorm/WebStorm-171.4249.40 webstorm/ws
mv ./webstorm/ws /opt/webstorm

### removing temporary files
rm -rf ./webstorm
rm ws.tar.gz

### grant access to all
chmod +x /opt/webstorm/bin/webstorm.sh

### creating soft link
from=/opt/webstorm/bin/webstorm
to=/usr/local/bin
ln -s $from $to

#Create Desktop Icon
cp ./desktop-icon/webstorm.desktop /usr/share/applications/
