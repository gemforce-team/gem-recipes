#!/bin/bash

source "$(dirname $0)/base.sh"

inf=$1
sup=$2
table=$3

FOLDER=crit-combine
TABLES="${table}"
TABLE_FILES="${TABLE_DIR}/${table}"

name_move() {
	gsize=$(< tmp sed -n "${2}p" | tr -dc '0-9')
	filename=cc$(printf "%0.7d" ${gsize})
	echo "$filename - gemforce ${GEMFORCE_VER} - ${TABLES}" >> $1
	mv $1 "${FOLDER}/$filename.txt"
}

for ((i=inf; i<=sup; i*=2))
do
	echo $i
	
	if [ $i -le 4096 ]
	then
		${GEMFORCE_DIR}/bin/critquery -qpe -f "${TABLE_FILES}" "$i" | tail -n +4 > tmp
		name_move tmp 1
		${GEMFORCE_DIR}/bin/critquery -qpeu -f "${TABLE_FILES}" "$i" | tail -n +11 > tmp
		name_move tmp 3
	else
		${GEMFORCE_DIR}/bin/critquery -qe -f "${TABLE_FILES}" "$i" | tail -n +4 > tmp
		name_move tmp 1
		${GEMFORCE_DIR}/bin/critquery -qeu -f "${TABLE_FILES}" "$i" | tail -n +11 > tmp
		name_move tmp 3
	fi
done
