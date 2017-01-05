#!/bin/bash


S_FILE=structure.txt

ISA (){
	echo "ISA Section Goes here"
}

GS (){
	echo "*** Welcome to GS Section ******"
	
	#Display GS section from structure file in table view
	printf "\n\nGeneral Format of GS Section:\n\n"
	column -s, -t < $S_FILE | grep 'Grp_id\|GS'
	
	#Store Element of GS section from structure file as an array
	elements=( $(cut -d',' -f3 $S_FILE  | grep GS) )

	#Display Element of GS section from structure file
	printf "\n\nAvailable Elements in GS section:\n\n"
	for (( i=0; i<${#elements[@]}; i++ )); do
 		echo $((i+1)) - ${elements[i]}; 
	done
	
	echo "Enter the Element number to be modified...."
	echo "need to code..."
}

while :
do
cat<< END
*******************************************
Choose the Segment to be altered in the input file

1. ISA
2. GS
3. ST
4. BMG
5. DTM
6. N1
7. MIT
8. MSG
9. SE
10. GE
11. IEA
0. Exit


END
	read -p "Enter the option..." INPUT_NO
	case $INPUT_NO in
		1)
			ISA
			;;
		2)
			GS
			;;
		0)
			echo "Bye Bye.."
			break
			;;
	esac
	
	read -p "Press Any Key to Continue, 0 Exit...." ONCE_MORE
	if [ "$ONCE_MORE" = "0" ]; then
		exit
	fi
done

