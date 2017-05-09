
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

#Download RStudio
wget https://download1.rstudio.org/rstudio-1.0.143-amd64.deb

#Install RStudio
gdebi rstudio-1.0.143-amd64.deb

rm rstudio-1.0.143-amd64.deb
