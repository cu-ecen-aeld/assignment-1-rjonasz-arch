#!/bin/bash

if [ $# != 2 ]
then
	echo "USAGE: $0 writefile writestr" > /dev/stderr
	exit 1
fi

DIR="$( dirname $1 )"
printf -v DIR "%q" ${DIR}

mkdir -p "${DIR}" &>/dev/null
if [ ! $? -eq 0  ]
then
	echo "${DIR} could not be created" > /dev/stderr
	exit 1
fi

printf -v WRITE_STR "%q" $2
printf -v FILE "%q" $1

(echo "${WRITE_STR}" > "${FILE}") &>/dev/null

if [ ! $? -eq 0  ]
then
	echo "$1 could not be written to" > /dev/stderr
	exit 1
fi

exit 0
