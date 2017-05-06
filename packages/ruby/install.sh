#!/bin/bash

#########################################################
#                                                       #
# author: pedro lira - pedulira@gmail.com               #
#                                                       #
#########################################################

### update repositories and install package
apt-get update && apt-get install -y $(cat dependencies) && rm -rf /var/lib/apt/lists/*

### install ruby
apt-get install ruby-full -y
