#!/bin/bash
#将目录中所有windows和adobe字体全部添加到linux（ubuntu）字体库里

#全局变量
desPath=/usr/share/fonts/win
#filePath=/home/hjy/Desktop/document_factory/on_the_way/ubuntu使用心得/figs

if [ -e $desPath ]
then
	#确定是否要删除已经存在文件夹里的字体
	echo "Delete the files in the directory : $desPath?(y/n)"
	read choice
	if [ $choice == "y" ]
	then
		sudo rm -r $desPath/*
	fi
else
	sudo mkdir $desPath
fi

#复制当前文件夹里的winFonts里的字体到目的文件夹
sudo cp ./winFonts/* $desPath
echo "finish copying the fonts into the folder. "

#给目的文件夹里的字体附上可执行的权限
sudo chmod 755 $desPath/*

echo "begin updating the fonts-cache in the system."
#更新整个系统下用户的字体缓存
sudo fc-cache -f -s -v
echo "finish updating the fonts-cache in the system."

#查看中文的字体
#fc-list ：lang=zh
