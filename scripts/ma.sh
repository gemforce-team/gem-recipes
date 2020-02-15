#!/bin/bash

source "$(dirname $0)/base.sh"

inf=$1
sup=$2
table1=$3
table2=table_leech

#QA=2
#GA=2.5
QA=6
GA=1
TC=120
AS=60

FOLDER=gccs/managem-amps
TABLES="${table1},${table2}"
TABLE_FILES="${TABLE_DIR}/${table1},${TABLE_DIR}/${table2}"

name_move() {
	gsize=$(< tmp sed -n '4p' | tr -dc '0-9')
	asize=$(< tmp sed -n '11p' | tr -dc '0-9')
	filename=ma$(printf "%0.4d" ${gsize})-${asize}
	echo "$filename - AMPS${QA}-${GA} TC${TC} A${AS} - gemforce ${GEMFORCE_VER} - ${TABLES}" >> $1
	mv $1 "${FOLDER}/$filename.txt"
}

for ((i=inf; i<=sup; i*=2))
do
	echo $i
	
	${GEMFORCE_DIR}/bin/mgquery-amps -rqpe -Q$QA -G$GA -T$TC -A$AS -f "${TABLE_FILES}" "$i" | tail -n +26 > tmp
	name_move tmp
	${GEMFORCE_DIR}/bin/mgquery-amps -rqpeu -Q$QA -G$GA -T$TC -A$AS -f "${TABLE_FILES}" "$i" | tail -n +45 > tmp
	name_move tmp
done
