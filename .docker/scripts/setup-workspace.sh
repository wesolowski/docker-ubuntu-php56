﻿#!/bin/bash

echo "install php-xdebug, joe, mc"

apt-get -y install php-xdebug joe mc

echo "add user docker to sudo-group"
usermod -a -G sudo docker

echo "copy config files"
cp /opt/docker/scripts/files/xdebug.ini /etc/php/5.6/mods-available/xdebug.ini
cp /opt/docker/scripts/files/.bash_aliases /home/docker/.bash_aliases
cp /opt/docker/scripts/files/servername.conf /etc/apache2/conf-available/servername.conf

ln -s ../conf-available/servername.conf /etc/apache2/conf-enabled/servername.conf

chown docker:docker /home/docker/.bash_aliases

echo "instal Blackfire"
wget -O - https://packagecloud.io/gpg.key | sudo apt-key add -
echo "deb http://packages.blackfire.io/debian any main" | sudo tee /etc/apt/sources.list.d/blackfire.list
sudo apt-get update
sudo apt-get install blackfire-agent
sudo apt-get install blackfire-php
