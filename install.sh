#!/bin/bash
#本文件用来重新安装系统之后，对一些常用的软件进行安装及配置。
filePath=~/software

#####################################################
echo "preparating..."
#####################################################
#更新软件源
sudo apt-get update 
##升级系统的软件，该命令会根据依赖关系对一些依赖文件进行删除和安装(sudo apt-get upgrade 对于依赖关系变更的软件不更新)
sudo apt-get dist-upgrade
# 删除系统不再使用的孤立软件--危险太大，在安装自己软件之前运行一下还是可以的。
sudo apt-get autoremove
#更新语言包--安装中文
sudo apt-get install  language-pack-zh-hans


#####################################################
echo "installing..."
#####################################################

#安装浏览器chrome
sudo apt-get install chromium-borwser
	#安装在线视频播放插件(针对chromium)
	sudo apt-get install pepperflashplugin-nonfree
	#安装在线视频播放插件(针对firefox)
	sudo apt-get install flashplugin-installer
echo "Chromium is installed!"


#安装gcc编译环境
sudo apt-get install build-essential
echo "Gcc is installed!"

#安装osdlyrics--方便rhythmbox显示歌词
sudo dpkg -i $filePath/osdlyrics_0.4.3-1~precise1_amd64.deb
sudo apt-get -f install
echo "Osdlyrics is installed!"
echo "change your lyrics path!"


#安装starDict字典
sudo apt-get install stardict
	#安装软件所需的字典和发音包
	cd ~/software/stardict
	chmod 755 installDicts.sh installPron.sh
	sudo ./installDicts.sh
	sudo ./installPron.sh
	cd ~
echo "Stardict is installed!"


#安装压缩工具7zip
sudo apt-get install 7zip-full
echo "7zip is installed!"


#安装ftp客户端FileZilla
sudo apt-get install filezilla
echo "Filezilla is installed!"


#安装文本编辑器geany
sudo apt-get install geany
echo "Geany is installed!"


#安装视频播放器VLC
sudo apt-get install vlc
echo "VLC player is installed!"


#安装位图图像处理gimp
sudo apt-get install gimp
echo "Gimp is installed!"


#安装矢量图像处理inkscape
sudo apt-get install inkscape
echo "Inkscape is installed!"


#安装流程图软件dia
sudo apt-get install dia
sudo apt-get install dia-gnome
echo "Dia is installed!"


#安装tex软件
sudo apt-get install blogilo
sudo apt-get install texlive-fonts-recommended
sudo apt-get install texmaker
	#安装win下的字体
	cd ~/software/addWinFonts
	chmod 755 addWinFonts.sh
	sudo ./addWinFonts.sh
	cd ~
echo "Tex is installed!"


#安装写blog软件blogilo
sudo apt-get install blogilo
echo "Blogilo is installed!"


#安装C集成环境codeblocks
sudo apt-get install codeblocks
echo "Codeblocks is installed!"


#安装java集成环境Eclipse
sudo apt-get install eclipse-jdt
sudo apt-get install eclipse-pde
sudo apt-get install eclipse-platform
sudo apt-get install eclipse-platform-data
sudo apt-get install eclipse-rcp
echo "Eclipse is installed!"


#安装pathon集成环境idle
sudo apt-get install idle-python2.7
echo "Idle is installed!"





#####################################################
echo "cleaning..."
#####################################################

#清理旧版本的软件缓存保留当前版本(sudo apt-get chlen不保留当前版本)
sudo apt-get autoclean 


#####################################################
echo "Manual configure..."
echo "设置osdlyrics歌词路径~/music/lyrics"
#####################################################
