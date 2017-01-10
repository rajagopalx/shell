#!/bin/bash


S_FILE=structure.txt
J_FILE=Inputfile.txt

ISA (){
        echo "ISA Section Goes here"
}

GS (){
        echo "*** Welcome to GS Section ******"

        #Display GS section from structure file in table view

        printf "\n\nGeneral Format of GS Section:\n\n"
        column -s, -t < $S_FILE | grep 'Grp_id\|GS'

        #Store Element of GS section from structure file as an array
        elements=( $(cut -d',' -f3 $S_FILE  | grep GS) )  # inner $() runs the command while the outer () causes the output to be an array



        printf "\n\nContent in Junk File...\n"
        o_junk=$(cat $J_FILE | grep 'GS')
        echo "$o_junk"
        oldjunk_escaped=$(sed 's/[\*\.]/\\&/g' <<<"$o_junk")

        jelements=( $(column -s* -t < $J_FILE | grep 'GS' | tr -d '~') )
        jelements=("${jelements[@]:1}")

        printf "\n\nBefore Tampering...\n"

        for (( i=0; i<${#jelements[@]}; i++ )); do
                echo "GS0"$((i+1)) - ${jelements[i]};
        done

        #Display Element of GS section from structure file
        printf "\n\nAvailable Elements in GS section:\n\n"
        for (( i=0; i<${#elements[@]}; i++ )); do
                echo $((i+1)) - ${elements[i]};
        done
        read -p "Enter the Element number to be modified...." ELE_INDEX
        printf "\n\nDefault Structure of GS0$ELE_INDEX:\n\n"
        column -s, -t < $S_FILE | grep "Grp_id\|GS0$ELE_INDEX"
        read -p "Enter the new value......." NEW_VAL

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

ST (){
        echo "*** Welcome to ST Section ******"

        #Display ST section from structure file in table view

        printf "\n\nGeneral Format of ST Section:\n\n"
        column -s, -t < $S_FILE | grep 'Grp_id\|ST'

                                                                                                                                                      39,1-8         8%
        #Store Element of ST section from structure file as an array
        elements=( $(cut -d',' -f3 $S_FILE  | grep ST) )                #inner $() runs the command while the outer () causes the output to be an array



        printf "\n\nContent in Junk File...\n"
        o_junk=$(cat $J_FILE | grep '^ST')
        echo "$o_junk"
        oldjunk_escaped=$(sed 's/[\*\.]/\\&/g' <<<"$o_junk")

        jelements=( $(column -s* -t < $J_FILE | grep '^ST' | tr -d '~') )
        jelements=("${jelements[@]:1}")

        printf "\n\nBefore Tamparing...\n"

        for (( i=0; i<${#jelements[@]}; i++ )); do
                echo "ST0"$((i+1)) - ${jelements[i]};
        done

        #Display Element of ST section from structure file
        printf "\n\nAvailable Elements in ST section:\n\n"
        for (( i=0; i<${#elements[@]}; i++ )); do
                echo $((i+1)) - ${elements[i]};
        done

        read -p "Enter the Element number to be modified...." ELE_INDEX
        printf "\n\nDefault Structure of ST0$ELE_INDEX:\n\n"
        column -s, -t < $S_FILE | grep "Grp_id\|ST0$ELE_INDEX"
        read -p "Enter the new value......." NEW_VAL


        nelements=("${jelements[@]}")

        nelements[($ELE_INDEX-1)]=$NEW_VAL

        echo "Result will be..."

        newjunk="ST"

        printf "%-10s | %-10s | %s\n" "ELEMENT" "BEFORE" "AFTER"
        printf "_______________________________\n"

                                                                                                                                                      123,0-1       18%
        for (( i=0; i<${#nelements[@]}; i++ )); do
                printf "ST0%-10s | %-10s | %s\n"  "$((i+1))" "${jelements[i]}" "${nelements[i]}"
                newjunk=$newjunk"\*"${nelements[i]}
        done

        newjunk="${newjunk//[$'\t\r\n ']}"
        newjunk=$newjunk"~"

        sed -i -e "s/$oldjunk_escaped/$newjunk/g" $J_FILE

        echo "Updated..."

}
BSN (){
        echo "*** Welcome to BSN Section ******"

        #Display BSN section from structure file in table view

        printf "\n\nGeneral Format of BSN Section:\n\n"
        column -s, -t < $S_FILE | grep 'Grp_id\|BSN'

        #Store Element of BSN section from structure file as an array
        elements=( $(cut -d',' -f3 $S_FILE  | grep BSN) )                #inner $() runs the command while the outer () causes the output to be an array



        printf "\n\nContent in Junk File...\n"
        o_junk=$(cat $J_FILE | grep 'BSN')
        echo "$o_junk"
        oldjunk_escaped=$(sed 's/[\*\.]/\\&/g' <<<"$o_junk")

        jelements=( $(column -s* -t < $J_FILE | grep 'BSN' | tr -d '~') )
        jelements=("${jelements[@]:1}")

        printf "\n\nBefore Tamparing...\n"

        for (( i=0; i<${#jelements[@]}; i++ )); do
                echo "BSN0"$((i+1)) - ${jelements[i]};
        done

        #Display Element of BSN section from structure file
        printf "\n\nAvailable Elements in BSN section:\n\n"
        for (( i=0; i<${#elements[@]}; i++ )); do
                echo $((i+1)) - ${elements[i]};
        done

        read -p "Enter the Element number to be modified...." ELE_INDEX
        printf "\n\nDefault Structure of BSN0$ELE_INDEX:\n\n"
        column -s, -t < $S_FILE | grep "Grp_id\|BSN0$ELE_INDEX"
        read -p "Enter the new value......." NEW_VAL


        nelements=("${jelements[@]}")

        nelements[($ELE_INDEX-1)]=$NEW_VAL

        echo "Result will be..."

        newjunk="BSN"

        printf "%-10s | %-10s | %s\n" "ELEMENT" "BEFORE" "AFTER"
        printf "_______________________________\n"

        for (( i=0; i<${#nelements[@]}; i++ )); do
                printf "BSN0%-10s | %-10s | %s\n"  "$((i+1))" "${jelements[i]}" "${nelements[i]}"
                newjunk=$newjunk"\*"${nelements[i]}
        done

        newjunk="${newjunk//[$'\t\r\n ']}"
        newjunk=$newjunk"~"

        sed -i -e "s/$oldjunk_escaped/$newjunk/g" $J_FILE

        echo "Updated..."

}
N1 (){
        echo "*** Welcome to N1 Section ******"

        #Display BSN section from structure file in table view

        printf "\n\nGeneral Format of N1 Section:\n\n"
        column -s, -t < $S_FILE | grep 'Grp_id\|N1'
        #Store Element of N1 section from structure file as an array
        elements=( $(cut -d',' -f3 $S_FILE  | grep N1) )                #inner $() runs the command while the outer () causes the output to be an array



        printf "\n\nContent in Junk File...\n"
        o_junk=$(cat $J_FILE | grep '^N1')
        echo "$o_junk"
        oldjunk_escaped=$(sed 's/[\*\.]/\\&/g' <<<"$o_junk")

        jelements=( $(column -s* -t < $J_FILE | grep '^N1' | tr -d '~') )
        jelements=("${jelements[@]:1}")

        printf "\n\nBefore Tamparing...\n"

        for (( i=0; i<${#jelements[@]}; i++ )); do
                echo "N10"$((i+1)) - ${jelements[i]};
        done

        #Display Element of N1 section from structure file
        printf "\n\nAvailable Elements in N1 section:\n\n"
        for (( i=0; i<${#elements[@]}; i++ )); do
                echo $((i+1)) - ${elements[i]};
        done

        read -p "Enter the Element number to be modified...." ELE_INDEX
        printf "\n\nDefault Structure of N10$ELE_INDEX:\n\n"
        column -s, -t < $S_FILE | grep "Grp_id\|N10$ELE_INDEX"
        read -p "Enter the new value......." NEW_VAL


        nelements=("${jelements[@]}")

        nelements[($ELE_INDEX-1)]=$NEW_VAL

        echo "Result will be..."

        newjunk="N1"

        printf "%-10s | %-10s | %s\n" "ELEMENT" "BEFORE" "AFTER"
        printf "_______________________________\n"

        for (( i=0; i<${#nelements[@]}; i++ )); do
                printf "N10%-10s | %-10s | %s\n"  "$((i+1))" "${jelements[i]}" "${nelements[i]}"
                newjunk=$newjunk"\*"${nelements[i]}
        done

        newjunk="${newjunk//[$'\t\r\n ']}"
        newjunk=$newjunk"~"

        sed -i -e "s/$oldjunk_escaped/$newjunk/g" $J_FILE

        echo "Updated..."

}

CTT (){
        echo "*** Welcome to CTT Section ******"

        #Display BSN section from structure file in table view

        printf "\n\nGeneral Format of CTT Section:\n\n"
        column -s, -t < $S_FILE | grep 'Grp_id\|CTT'

        #Store Element of CTT section from structure file as an array
        elements=( $(cut -d',' -f3 $S_FILE  | grep CTT) )                #inner $() runs the command while the outer () causes the output to be an array



        printf "\n\nContent in Junk File...\n"
        o_junk=$(cat $J_FILE | grep 'CTT')
        echo "$o_junk"
        oldjunk_escaped=$(sed 's/[\*\.]/\\&/g' <<<"$o_junk")

        jelements=( $(column -s* -t < $J_FILE | grep 'CTT' | tr -d '~') )
        jelements=("${jelements[@]:1}")

        printf "\n\nBefore Tampering...\n"

        for (( i=0; i<${#jelements[@]}; i++ )); do
                echo "CTT0"$((i+1)) - ${jelements[i]};
        done

        #Display Element of CTT section from structure file
        printf "\n\nAvailable Elements in CTT section:\n\n"
        for (( i=0; i<${#elements[@]}; i++ )); do
                echo $((i+1)) - ${elements[i]};
        done

                                                                                                                                                          read -p "Enter the Element number to be modified...." ELE_INDEX
        printf "\n\nDefault Structure of CTT0$ELE_INDEX:\n\n"
        column -s, -t < $S_FILE | grep "Grp_id\|CTT0$ELE_INDEX"
        read -p "Enter the new value......." NEW_VAL


        nelements=("${jelements[@]}")

        nelements[($ELE_INDEX-1)]=$NEW_VAL

        echo "Result will be..."

        newjunk="CTT"

        printf "%-10s | %-10s | %s\n" "ELEMENT" "BEFORE" "AFTER"
        printf "_______________________________\n"

        for (( i=0; i<${#nelements[@]}; i++ )); do
                printf "CTT0%-10s | %-10s | %s\n"  "$((i+1))" "${jelements[i]}" "${nelements[i]}"
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
4. BSN
5.
6. N1
7. N3
8. MSG
9. SE
10. GE
11. IEA
17. CTT
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
                3)
                        ST
                        ;;
                4)
                        BSN
                        ;;
                5)
                        HL-level1
                        ;;
                6)
                        N1
                        ;;
                7)
                        N3
                        ;;
                8)
                        N4
                        ;;
                9)
                        HL-level2
                        ;;
               10)
                        PRF
                        ;;
               11)
                        REF
                        ;;
               12)
                        HL-level3
                        ;;
               13)
                        MAN
                        ;;
               14)
                        HL-level4
                        ;;
               15)
                        HL-level5
                        ;;
               16)
                        LIN
                        ;;
               17)
                        CTT
                        ;;
               18)
                        SE
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
