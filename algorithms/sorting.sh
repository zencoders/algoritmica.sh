#!/bin/bash

if [ "$#" == "0"  ]; then
    echo "You have to provide an array"
    exit 1
fi

insertionsort(){
count=${#ELEMS[@]}
for((i=1;i<count;i++))
do
    Key=${ELEMS[i]}
    j=$((i-1))
    while [ $Key -lt ${ELEMS[j]}  ]
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

insertionsort_r(){
count=${#ELEMS[@]}
for((i=1;i<count;i++))
do
    Key=${ELEMS[i]}
    j=$((i-1))
    while [ $Key -gt ${ELEMS[j]}  ]
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

ELEMS=("$@")

if [ "$0" == "./sort.insertionsort"  ]; then
    insertionsort
elif [ "$0" == "./sort.insertionsort_r"  ]; then
    insertionsort_r
fi

echo ${ELEMS[@]}


