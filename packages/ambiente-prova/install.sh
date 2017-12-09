#!/bin/bash

wget -O /tmp/labp1.tar.gz "http://150.165.98.39/prova/labp1.tar.gz" && \
   tar xzvf /tmp/labp1.tar.gz -C / && \
   update-grub

rm labp1.tar.gz
