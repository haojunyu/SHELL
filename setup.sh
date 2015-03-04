#!/bin/bash
#当前文件夹下所有的shell脚本都为本人所写，为方便使用，将该目录设置为系统的环境变量


echo $PATH
export PATH="$PATH:$(pwd)"

echo "set up the PATH successfully!"
echo $PATH

#/usr/development/jdk1.7.0_15/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/hjy/myShell
