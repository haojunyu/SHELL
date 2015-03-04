#!/bin/bash
#本文件用来重新安装系统之后，对一些常用的软件进行安装及配置。
filePath=~/software

#####################################################
echo "preparating..."
#####################################################
#安装apache2
sudo apt-get install apache2
#安装php
sudo apt-get install libapache2-mod-php5 php5
#安装mysql
sudo apt-get install mysql-server-5.0 mysql-common mysql-admin
#安装包使php和mysql结合
sudo apt-get install php5-mysql
