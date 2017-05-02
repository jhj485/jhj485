#!/bin/bash
list1=`ls -p | grep / | sort -f`
list2=`ls -p | grep [^/]$ | sort -f`
i=0
j=0
location=`pwd`
file=`ls $location | wc -l`
echo "=== print file information ==="
echo "current directory : " $location
echo "the number of elements : " $file
echo
for file1 in $list1 $list2
do
i=`expr $i + 1`
if [ -d $file1 ]
then
	echo [$i] $file1
	echo "------------INFORMATION-------------"
	echo "[34m file type : 디 렉 토 리 [m"
	echo "File size : " `stat -c %s $file1`
	echo "Last change time : " `stat -c %y $file1`
	echo "Permission : " `stat -c %a $file1`
	echo "Absolute path : " `pwd`/$file1
	echo "Relative path : " ./$file1
	if [ -s $file1 ]
	then
list3=`ls -p $file1 | sort -f`
			

			for file2 in $list3
			do
			if [ -d $file1/$file2 ]
			then
j=`expr $j + 1`
				echo "    "[$j] $file1$file2
				echo "    -------------INFORMATION------------"
				echo "    [34m file type : 디 렉 토 리 [m"
				echo "    File size : " `stat -c %s $file1/$file2`
				echo "    Last change time : " `stat -c %y $file1/$file2`
				echo "    Permission : " `stat -c %a $file1/$file2`
				echo "    Absolute path : " `pwd`/$file2
				echo "    Relative path : " .$file1$file2
			fi
			done

			for file5 in $list3
			do
			if [ -f $file1/$file5 ]
			then
j=`expr $j + 1`
			echo "    "[$j] $file1$file5
			echo "    -------------INFORMATION------------"
			if [ -s $file1/$file5 ]
			then
				echo "    file type : 일 반 파 일 "
			else
				echo "    file type : 일 반 빈 파 일 "
			fi
			echo "    File size : " `stat -c %s $file1/$file5`
			echo "    Last change time : " `stat -c %y $file1/$file5`
			echo "    Permission : " `stat -c %a $file1/$file5`
			echo "    Absolute path : " `pwd`/$file5
			echo "    Relative path : " .$file1$file5
			fi
			done

			for file6 in $list3
			do
			if [ -p $file1/$file6 ]
			then
j=`expr $j + 1`
			echo "    "[$j] $file1$file6
			echo "    -------------INFORMATION------------"
			echo "    [32m File type : FIFO [m"
			echo "    File size : " `stat -c %s $file1/$file6`
			echo "    File size : " `stat -c %s $file1/$file6`
			echo "    Last change time : " `stat -c %y $file1/$file6`
			echo "    Permission : " `stat -c %a $file1/$file6`
			echo "    Absolute path : " `pwd`/$file6
			echo "    Relative path : " .$file1$file6
			fi
			done
j=0

	else
	echo [$i] $file1
	echo "------------INFORMATION-------------"
	echo "[34m file type : 디 렉 토 리 [m"
	echo "File size : " `stat -c %s $file1`
	echo "Last change time : " `stat -c %y $file1`
	echo "Permission : " `stat -c %a $file1`
	echo "Absolute path : " `pwd`/$file1
	echo "Relative path : " ./$file1
	fi
fi
done
for file3 in $list2
do
	if [ -f $file3 ]
	then
i=`expr $i + 1`
	echo [$i] $file3
	echo "------------INFORMATION------------"
		if [ -s $file3 ]
		then
			echo "File type : 일 반 파 일"
		else
			echo "File type : 일 반 빈 파 일"
		fi
	
echo "File size : " `stat -c %s $file3`
echo "Last change time : " `stat -c %y $file3`
echo "Permission : " `stat -c %a $file3`
echo "Absolute path : " `pwd`/$file3
echo "Relative path : " ./$file3
	fi
done
for file4 in $list2
do
if [ -p $file4 ]
then
i=`expr $i + 1`
echo [$i] $file4
echo "------------INFORMATION------------"
echo "[32m File type : FIFO [m"
echo "File size : " `stat -c %s $file4`
echo "Last change time : " `stat -c %y $file4`
echo "Permission : " `stat -c %a $file4`
echo "Absolute path : " `pwd`/$file4
echo "Relative path : " ./$file4
fi
done

