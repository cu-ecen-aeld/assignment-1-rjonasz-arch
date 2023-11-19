#!/bin/bash

if [ $# != 2 ]
then
	echo "USAGE: $0 filesdir searchstr" > /dev/stderr
	exit 1
fi

DIR=$1
if [ ! -d ${DIR} ]
then
	echo "${DIR} is not a directory!" > /dev/stderr
	exit 1
else
	SEARCH_STR=$2
	FILES=( $(find -L ${DIR} -name \* -type f -print) )
	NUM_MATCH=0
	
	for FILE in ${FILES[@]}
	do
		FILE_MATCH=$(grep -c "${SEARCH_STR}" $FILE)
		if [ $? -eq 0 ]
		then
			NUM_MATCH=$(( ${NUM_MATCH} + ${FILE_MATCH} ))
		fi
	done

	echo "The number of files are ${#FILES[@]} and the number of matching lines are ${NUM_MATCH}"
fi
