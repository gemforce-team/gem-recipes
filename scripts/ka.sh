#!/bin/bash

source "$(dirname $0)/base.sh"

inf=$1
sup=$2
table1=$3
table2=table_crit

#QA=2
#GA=2.5
QA=8
GA=1
TC=120
AS=60

FOLDER=gccs/killgem-amps
TABLES="${table1},${table2}"
TABLE_FILES="${TABLE_DIR}/${table1},${TABLE_DIR}/${table2}"

name_move() {
	gsize=$(< tmp sed -n '4p' | tr -dc '0-9')
	asize=$(< tmp sed -n '12p' | tr -dc '0-9')
	filename=ka$(printf "%0.4d" ${gsize})-${asize}
	echo "$filename - AMPS${QA}-${GA} TC${TC} A${AS} - gemforce ${GEMFORCE_VER} - ${TABLES}" >> $1
	mv $1 "${FOLDER}/$filename.txt"
}

for ((i=inf; i<=sup; i*=2))
do
	echo $i
	
	${GEMFORCE_DIR}/bin/kgquery-amps -rqpe -Q$QA -G$GA -T$TC -A$AS -f "${TABLE_FILES}" "$i" | tail -n +29 > tmp
	name_move tmp
	${GEMFORCE_DIR}/bin/kgquery-amps -rqpeu -Q$QA -G$GA -T$TC -A$AS -f "${TABLE_FILES}" "$i" | tail -n +51 > tmp
	name_move tmp
done
