#!/bin/bash

#################################################################################################
#                                                                                                                                                                                       #
# Script de instalaçãocabal-install                                                                                                                        # #
# Autores: Ana Godoy - godoyisadora@gmail.com      #
# Abril de 2017                                                                                                                                                       #
#                                                                                                                                                                                       #
#################################################################################################

#Update
apt-get -y update

apt-get -y install gcc g++
apt-get install zlib1g-dev

#Install Cabal
apt-get -y install software-properties-common python-software-properties
yes ' ' |add-apt-repository -y ppa:hvr/ghc
apt-get -y update
apt-get install -y cabal-install-1.22 ghc-7.10.3
cat >> ~/.bashrc <<EOF
export PATH="\$HOME/.cabal/bin:/opt/cabal/1.22/bin:/opt/ghc/7.10.3/bin:\$PATH"
EOF
export PATH=~/.cabal/bin:/opt/cabal/1.22/bin:/opt/ghc/7.10.3/bin:$PATH

wget http://hackage.haskell.org/package/cabal-install-1.24.0.2/cabal-install-1.24.0.2.tar.gz
tar -vzxf cabal-install-1.24.0.2.tar.gz
cd cabal-install-1.24.0.2
./bootstrap.sh
EXTRA_CONFIGURE_OPTS="" ./bootstrap.sh
export PATH=$HOME/.cabal/bin:$PATH
cd ..
rm cabal-install-1.24.0.2.tar.gz
#rm -r cabal-install-1.24.0.2
