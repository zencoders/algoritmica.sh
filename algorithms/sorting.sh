#!/bin/bash

###Insertion sort. It will order reversewise if -r
###parameter is provided.
###The algorithm expects that an array called ELEMS
###containing the numerical value to be ordered is
###already defined.
insertionsort(){
count=${#ELEMS[@]}
for((i=1;i<count;i++))
do
    Key=${ELEMS[i]}
    j=$((i-1))
    #for the sake of honesty, actually we do not check
    #if $1 is really -r. It is enough to define it.
    while ([[ ! $1 ]] && [[ $Key -lt ${ELEMS[j]} ]]) \
          || ([[ $1 ]] && [[ $Key -gt ${ELEMS[j]} ]]) ;
    do
        ELEMS[j+1]=${ELEMS[j]}
        let j--
        if [ $j == -1 ]
        then
            break
        fi
    done
    ELEMS[j+1]=$Key
done
}

