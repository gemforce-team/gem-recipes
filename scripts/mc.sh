#!/bin/bash

source "$(dirname $0)/base.sh"

inf=$1
sup=$2
table=$3

FOLDER=gccs/managem-combine
TABLES="${table}"
TABLE_FILES="${TABLE_DIR}/${table}"

name_move() {
	gsize=$(< tmp sed -n "${2}p" | tr -dc '0-9')
	filename=mc$(printf "%0.6d" ${gsize})
	echo "$filename - gemforce ${GEMFORCE_VER} - ${TABLES}" >> $1
	mv $1 "${FOLDER}/$filename.txt"
}

for ((i=inf; i<=sup; i*=2))
do
	echo $i
	
	if [ $i -le 4096 ]
	then
		${GEMFORCE_DIR}/bin/mgquery-alone -qpe -f "${TABLE_FILES}" "$i"c | tail -n +4 > tmp
		name_move tmp 1
		${GEMFORCE_DIR}/bin/mgquery-alone -qpeu -f "${TABLE_FILES}" "$i"c | tail -n +11 > tmp
		name_move tmp 3
	else
		${GEMFORCE_DIR}/bin/mgquery-alone -qe -f "${TABLE_FILES}" "$i"c | tail -n +4 > tmp
		name_move tmp 1
		${GEMFORCE_DIR}/bin/mgquery-alone -qeu -f "${TABLE_FILES}" "$i"c | tail -n +11 > tmp
		name_move tmp 3
	fi
done
