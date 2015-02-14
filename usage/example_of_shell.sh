#display instruction
echo "These are some examples of shell instructions."


#input instruction
read fname
echo $fname


#judge the existence of the file
path_des=$HOME/sql_backup/aa
if [ ! -d "$path_des" ]
then
	$(mkdir $path_des)
	echo "You have backuped the database $db_name at first time."
fi

#date instruction
echo "date is `date`"


#evalution express
expr 4 + 5


#condition instruction
	#number  	-eq -ne -gt -ge -lt -le
	#string		=:  !=  -z  -n
	#file		-e  -r  -w	-x  -s  -d  -f  -c  -b
echo "input a marks"
read marks
if [ $marks -le 80 ]
then 
	echo "Your Grade is Average."
elif [ $marks -gt 80 -a $marks -le 90 ]
then
	echo "Your Grade is Good."
else
	echo "Your grade is Outstanding."
fi


#case instruction
echo "List of Services Officed by Diaz"
echo "1) phone"
echo "2) email"
echo "a) QQ"
echo "Select the service for which you need more information[1-3]:"
read choice
case $choice in
1) echo "phone";;
2) echo "email";;
a) echo "QQ";;
*) echo "out of range";;
esac


#loop statement
	#while <condition>
ecode=1000
while [ $ecode -le 1008 ]
do
echo -n "code="
echo $ecode
((ecode=$ecode+1))
done

	#until
	#for var_name in <list_of_values>

#process instruction
	#wc filename & 	--the process running in the background
	#ps				--check the process
	#kill pid		--stop the process whose pid is pid
	#time command	--evaluate the time of executing the command

#exit instruction
exit
