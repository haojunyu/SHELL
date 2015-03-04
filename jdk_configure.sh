#!/bin/bash
#配置jdk的运行环境


echo "Warning: please reset the javaHome"
#jdk文件的主目录
javaHome = /home/hjy/公共的/jdk1.7.0_51

export JAVA_HOME=$javaHome

export JRE_HOME=$javaHome"/jre"

export CLASSPATH=.:$CLASSPATH:$JAVA_HOME/lib:$JAVA_HOME/jre/lib

#需要shell使用管理员权限将JAVA_HOME，JRE_HOME，CLASSPATH这三个变量导入到 /etc/environment文件中


