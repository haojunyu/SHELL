#!/bin/bash
#将当前目录中main.c文件编译并且用导入in.txt文件中的数据运行

gcc $PWD/main.c -o $PWD/main
$PWD/main < in.txt
