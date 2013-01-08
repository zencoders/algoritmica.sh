#!/usr/bin/env bash

### Obtain the path of this script
SOURCE="${BASH_SOURCE[0]}"
DIR="$( dirname "$SOURCE" )"
while [ -h "$SOURCE" ]
do 
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
  DIR="$( cd -P "$( dirname "$SOURCE"  )" && pwd )"
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

### Sourcing of the algorithms from a path relative to DIR
. $DIR/algorithms/sorting.sh

### Check if an array has been provided
if [ "$#" == "0"  ]; then
    echo "You have to provide an array"
    exit 1
fi

SCRIPTNAME=`basename $0`
ELEMS=("$@")

### Call algorithms basing on the callee
case $SCRIPTNAME in
    sort.insertionsort)      insertionsort ;;
    sort.insertionsort_r)    insertionsort -r;;
esac
 
echo ${ELEMS[@]}

