
#!/bin/bash
#################################################################################################
#                                                                                                                                                                                       #
# Script de instalação RStudio
                                                     # #
# Autores: Ana Godoy - godoyisadora@gmail.com      #
# Abril de 2017                                                                                                                                                       #
#                                                                                                                                                                                       #
#################################################################################################

#Update
apt-get -y update

#Install gdebi
apt-get -y install gdebi-core

#Install plugins
wget --tries=3 --timeout=120 http://ftp.ca.debian.org/debian/pool/main/g/gstreamer0.10/libgstreamer0.10-0_0.10.36-1.5_amd64.deb
wget --tries=3 --timeout=120 http://ftp.ca.debian.org/debian/pool/main/g/gst-plugins-base0.10/libgstreamer-plugins-base0.10-0_0.10.36-2_amd64.deb
sudo dpkg -i libgstreamer0.10-0_0.10.36-1.5_amd64.deb
sudo dpkg -i libgstreamer-plugins-base0.10-0_0.10.36-2_amd64.deb
sudo apt-mark hold libgstreamer-plugins-base0.10-0
sudo apt-mark hold libgstreamer0.10


#Download RStudio for Ubuntu 16.04 to Ubuntu 17.10 64bits

wget --tries=3 --timeout=120 https://download1.rstudio.org/rstudio-xenial-1.1.383-amd64.deb

#Install RStudio

sudo dpkg -i rstudio-*-amd64.deb


rm rstudio-xenial-1.1.383-amd64.deb]
rm libgstreamer0.10-0_0.10.36-1.5_amd64.deb
rm libgstreamer-plugins-base0.10-0_0.10.36-2_amd64.deb
