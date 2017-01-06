#!/bin/bash


S_FILE=structure.txt
J_FILE=junk.txt

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
	
	
	
	printf "\n\nContent in Junk File...\n"
	o_junk=$(cat $J_FILE | grep 'GS')
	echo "$o_junk"	
	oldjunk_escaped=$(sed 's/[\*\.]/\\&/g' <<<"$o_junk")

	jelements=( $(column -s* -t < $J_FILE | grep 'GS' | tr -d '~') )
	jelements=("${jelements[@]:1}")

	printf "\n\nBefore Tamparing...\n"
 	
	for (( i=0; i<${#jelements[@]}; i++ )); do
 		echo "GS0"$((i+1)) - ${jelements[i]}; 
	done
	
	#Display Element of GS section from structure file
	printf "\n\nAvailable Elements in GS section:\n\n"
	for (( i=0; i<${#elements[@]}; i++ )); do
 		echo $((i+1)) - ${elements[i]}; 
	done

	read -p "Enter the Element number to be modified...." ELE_INDEX
	read -p "Enter the new value......." NEW_VAL


	printf "\n\nDefault Structure of GS0$NEW_VAL:\n\n"
	column -s, -t < $S_FILE | grep "Grp_id\|GS0$NEW_VAL"

	nelements=("${jelements[@]}")
	
	nelements[($ELE_INDEX-1)]=$NEW_VAL

	echo "Result will be..."
	
	newjunk="GS"	
	
	printf "%-10s | %-10s | %s\n" "ELEMENT" "BEFORE" "AFTER"
	printf "_______________________________\n"

	for (( i=0; i<${#nelements[@]}; i++ )); do
		printf "GS0%-10s | %-10s | %s\n"  "$((i+1))" "${jelements[i]}" "${nelements[i]}"
		newjunk=$newjunk"\*"${nelements[i]}
	done
	
	newjunk="${newjunk//[$'\t\r\n ']}"
	newjunk=$newjunk"~"

	sed -i -e "s/$oldjunk_escaped/$newjunk/g" $J_FILE
	
	echo "Updated..."
	
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

