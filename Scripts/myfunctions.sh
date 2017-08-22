#!/bin/bash

custom_rem()
{
	echo "Overriding rm. Moving to Trash."
	mv $1 $2 $3 $4 $5 $6 /home/maverick/.local/share/Trash/files 
}

gcc1()
{
	echo
	echo
	len=`echo $1 | wc -c`
	len=`expr $len - 3`
	object_name=`echo $1 | cut -c 1-$len`
	gcc $1 -lm -lpthread -o $object_name && ./$object_name $2
	echo
	echo
	echo
}

gpp()
{
	echo
	echo
	len=`echo $1 | wc -c`
	len=`expr $len - 5`
	object_name=`echo $1 | cut -c 1-$len`
	g++ $1 -lm -o $object_name && ./$object_name $2
	echo 
	echo
	echo
}


mpirungcc()
{
	echo 
	echo
	len=`echo $1 | wc -c`
	len=`expr $len - 3`
	object_name=`echo $1 | cut -c 1-$len`
	mpicc $1 -o $object_name && mpirun -np $2 ./$object_name	
	echo 
	echo
	echo
}


mpirungpp()
{
	echo 
	echo
	len=`echo $1 | wc -c`
	len=`expr $len - 5`
	object_name=`echo $1 | cut -c 1-$len`
	mpic++ $1 -o $object_name && mpirun -np $2 ./$object_name	
	echo 
	echo
	echo
}


nasm1()
{
	echo 
	echo
	len=`echo $1 | wc -c`
	len=`expr $len - 5`
	object_name=`echo $1 | cut -c 1-$len`
	nasm -f aout $1 && ld -m elf_i386 -o $object_name $object_name".o" && ./$object_name
	rm $object_name".o"
	echo 
	echo
	echo
}

transmission_stat()
{
	transmission-remote $1":9099" -l 
}

gitupload()
{
	echo 
	echo
	git add $1
	git commit -m $1
	git push -u origin master
	echo 
	echo
}

scijava()
{
	echo
	echo
	javac -cp $CLASSPATH $1
	len=`echo $1 | wc -c`
	len=`expr $len - 6`
	object_name=`echo $1 | cut -c 1-$len`
	LD_LIBRARY_PATH=$LD_LIBRARY_PATH java -cp $CLASSPATH:. -DSCI=$SCI $object_name
	echo
	echo
}
