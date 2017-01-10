#!/bin/bash


ST_FILE=structure.txt
JN_FILE=junk.txt

replaceFn(){

    segment=$1
    level=$2

    printf "===================  You selected $segment segment  ==================\n"

    #Displaying Genertal structure
    printf "\n\nGeneral Structure of $segment segment:\n\n"
    column -s, -t < $ST_FILE | awk -v var="$segment" -v i_no="$INPUT_NO" '( ($2 == var || $2 ~ "Segment" ) && ($1 == i_no || $1 ~ "id" )) '

    #Displaying segment in the input file
    printf "\n\nContent present in the Input File:\n\n"
    orginal_input=$(cat $JN_FILE | grep -m $level "^$segment" | tail -n1)
    printf "$orginal_input\n"

    #Converted to Escaped Characters
    orginal_input_escaped=$(sed 's/[\*\.]/\\&/g' <<<"$orginal_input")


    # Get the elements of selected segment from structure file and store in array
    elements=( $(awk -v seg="$segment" -v i_no="$INPUT_NO" -F, '{ if ($1 == i_no && $2 == seg) print $3; }' $ST_FILE ) )

    #Remove Spaces and tilde in selected line input file
    junk_line="$(echo -e "${orginal_input}" | tr -d '[:space:]~')"
    
    #echo "$junk_line"

    total_elements=${#elements[@]}

    #echo "$total_elements"

    #junk_elements=($(awk -v total="$total_elements" -F* '{
    # for (i = 2; i <= total+1; i++) {
    #  if ($i=="")
    #    {print "null"}
    #  else
    #   {print $i} 
    #  }  }' <<< "$junk_line"))

    #In Input file Split By the * delimiter and stored into array
    IFS="*" read -ra junk_elements <<< "$junk_line"

    #Slice the first index
    junk_elements=("${junk_elements[@]:1}")

    printf "\n\nThe detailed list of values present before tampering:\n\n"

    # detailed Display of input element

    for (( i=0; i<${#junk_elements[@]}; i++ )); do
        ele=$((i+1))
        printf -v ele "%02d" $ele ; echo $segment$ele - ${junk_elements[i]};
    done

    # Display Available taken element from structure file

    printf "\n\nAvailable Elements in $segment segment:\n\n"
    for (( i=0; i<${#elements[@]}; i++ )); do
        ele=$((i+1))
        printf -v ele "%02d" $ele ; echo $ele - ${elements[i]};
    done

    read -p "Enter the Element number to be modified (two digits)...." ELE_INDEX

    # Display Info about selected element

    modify_element_name=$segment$ELE_INDEX

    printf "\n\nInformation about $modify_element_name element\n\n"


    old_junk_ele=${junk_elements[10#$ELE_INDEX-01]}

    awk -v ino="$INPUT_NO" -v m_ele="$modify_element_name" -v o_ele="$old_junk_ele" -F, 'BEGIN {print "Min_Val:\tMax_Val:\tDefault_Val:\tExisting_Val:";} { if ($3 == m_ele && $1 == ino) print $4, "\t\t", $5, "\t\t", $6, "\t\t", o_ele, "\n\n"; } ' $ST_FILE


    read -p "Enter the new value......." NEW_VAL

    #Create new array, copy junk elements and replace new value 
    new_elements=("${junk_elements[@]}")
    new_elements[(10#$ELE_INDEX-01)]=$NEW_VAL


    printf "\n\nReplacement results will be...\n\n"

    new_junk_line=$segment

    printf "%-10s | %-10s | %s\n" "ELEMENT" "BEFORE" "AFTER"
    printf "_______________________________\n"

    for (( i=0; i<${#new_elements[@]}; i++ )); do
        printf "%-10s | %-10s | %s\n"  "$segment$((i+1))" "${junk_elements[i]}" "${new_elements[i]}"
        new_junk_line=$new_junk_line"\*"${new_elements[i]}
    done

    new_junk_line="${new_junk_line//[$'\t\r\n ']}"
    new_junk_line=$new_junk_line"~"

    printf "\nOld Line: $orginal_input_escaped\n"
    printf "New Line: $new_junk_line\n"

    read -r -p "Are you sure? [y/N] " response
    if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
    then
        sed -i -e "s/$orginal_input_escaped/$new_junk_line/g" $JN_FILE
        printf "The replacement is updated in the Input file \n"
    else
        printf "ReEnter..\n"
    fi

}

while :
do
cat<< END
*******************************************
Choose the Segment to be altered in the input file

1.  ISA
2.  GS
3.  ST
4.  BSN
5.  HL - level1
6.  N1
7.  N3
8.  N4
9.  HL - level2
10. PRF
11. REF
12. HL - level3
13. MAN
14. HL - level4
15. HL - level5
16. LIN
17. CTT
18. SE
0. Exit


END
        read -p "Enter the option..." INPUT_NO
        case $INPUT_NO in
                1)  replaceFn ISA 1 ;;
                2)  replaceFn GS 1 ;;
                3)  replaceFn ST 1 ;;
                4)  replaceFn BSN 1 ;;
                5)  replaceFn HL 1 ;;
                6)  replaceFn N1 1 ;;
                7)  replaceFn N3 1 ;;
                8)  replaceFn N4 1 ;;
                9)  replaceFn HL 2 ;;
               10)  replaceFn PRF 1 ;;
               11)  replaceFn REF 1 ;;
               12)  replaceFn HL 3 ;;
               13)  replaceFn MAN 1 ;;
               14)  replaceFn HL 4 ;;
               15)  replaceFn HL 5 ;;
               16)  replaceFn LIN 1 ;;
               17)  replaceFn CTT 1 ;;
               18)  replaceFn SE 1 ;;
                0)  echo "Bye Bye.."
                    break ;;
        esac

        read -p "Press Any Key to Continue, 0 Exit...." ONCE_MORE
        if [ "$ONCE_MORE" = "0" ]; then
                exit
        fi
done
