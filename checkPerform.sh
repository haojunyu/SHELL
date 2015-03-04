#! /bin/bash
# 通过使用者和名称来获取进程的CPU/内存/句柄数等信息

# 通过进程的使用者和名称来获取进程的PID
function GetPId
{
	pId=`ps -u $1 | grep $2 | grep -v 'grep' | grep -v 'vi' | grep -v 'dbx\n' | grep -v 'tail' | grep -v 'start' | grep -v 'stop' | sed -n 1p | awk '{print $1}'`
	echo $pId
}
# 通过pId来获取该进程CPU的使用情况
function GetCpu
{
	cpuValue=`ps -p $1 -o pcpu | grep -v CPU | awk '{print $1}' | awk -F. '{print $1}'`
	echo $cpuValue
}


# 通过pId来获取进程内存使用情况
function GetMem
{
	memUsage=`ps -p $1 -o vsz | grep -v VSZ`
	((memUsage /= 1000))
	echo $memUsage
}

# 通过pId来获取该进程句柄使用量
function GetHandle
{
	handle=`ls /proc/$1/fd | wc -l`
	echo $handle
}

# 通过pName来获取该进程运行的个数
function GetProcessNum
{
	runNum=`ps -efu $1 | grep $2 | grep -v 'grep' | grep -v 'vi' | grep -v 'dbx\n' | grep -v 'tail' | grep -v 'start' | grep -v 'stop' | wc -l`
	echo $runNum
}

# 获取系统CPU负载
function GetSysCpu
{
	cpuIdle=`vmstat 1 5 | sed -n '3,$p' | awk '{x = x + $15} END {print x/5}' | awk -F. '{print $1}'`
	cpuNum=`echo "100-$cpuIdle" | bc`
	echo $cpuNum
}


# 提示脚本用法
if [ "$#" -ne 2 ]
then 
	echo "Usage: $0 pUser pName"
	exit 1
fi

pName=`ps -u $1 | grep $2 | grep -v 'grep' | grep -v 'vi' | grep -v 'dbx\n' | grep -v 'tail' | grep -v 'start' | grep -v 'stop' | sed -n 1p | awk '{print $4}'`
echo "------------------------PROCESS: $pName ------------------------"

pId=`GetPId $1 $2`
# 检测进程是否存在
if [ "-$pId" == "-" ]
then
	echo "The process does not exist."
	exit 2
fi


# check cpu
cpu=`GetCpu $pId`
if [ $cpu -gt 50 ]
then
	echo "Warning: The usage of cpu($cpu%) is larger than 50%."
else
	echo "The usage of cpu($cpu%) is normal."
fi

# check memory
mem=`GetMem $pId`
if [ $mem -gt 500 ]
then
	echo "Warning: The usage of memory(${mem}M) is larger than 500M."
else
	echo "The usage of memory(${mem}M) is normal."
fi

# check running number of Process
runNum=`GetProcessNum $1 $2`
if [ $runNum -gt 20 ]
then
	echo "Warning: The number of process($runNum) is more than 20."
else
	echo "The number of process($runNum) is normal."
fi


# check handle
han=`GetHandle $pId`
if [ $han -gt 500 ]
then
	echo "Warning: The usage of handle($han) is more than 500M."
else
	echo "The usage of handle($han) is normal."
fi

echo "------------------------------SYSTEM-----------------------------"
# check system CPU
sysCpu=`GetSysCpu`
if [ $sysCpu -gt 90 ]
then
	echo "Warning: The usage of system cpu($sysCpu%) is larger than 90%."
else
	echo "The usage of system cpu($sysCpu%) is normal."
fi
