#!/bin/bash
#将目录中所有非pdf格式的图片全部转换为pdf格式的文件，方便latex排版

#全局变量
filePath=$1
#filePath=/home/hjy/Desktop/document_factory/on_the_way/ubuntu使用心得/figs

cd $1
fileList=$(ls $1)
counter=0;
for file in $fileList
do 
	echo $file
	fileName=$(echo $file | cut -d . -f 1)
	fileType=$(echo $file | cut -d . -f 2)
	if [ $fileType != "pdf" ]
	then
		convert $file "$fileName.pdf"
		((counter=$counter+1))
		rm $file
	fi
done

echo "convert $counter file to pdf successfully!!!"
