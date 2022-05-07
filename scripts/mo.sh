#!/bin/bash

source "$(dirname $0)/base.sh"

s=$1
c=$2
table1=table_mgsappr
table2=table_leech
table3=$3

QA=2
GA=2.5
#QA=6
#GA=1
TC=120
AS=${4:-60} # 60 if unset

FOLDER=gccs/managem-omnia
TABLES="${table1},${table2},${table3}"
TABLE_FILES="${TABLE_DIR}/${table1},${TABLE_DIR}/${table2},${TABLE_DIR}/${table3}"

echo "$s - $c"
filename="mo"$(printf "%0.4d-%0.6d" $s $c)
if [[ $AS != 60 ]]; then
	filename+="-A${AS}"
fi
desc="$filename - AMPS${QA}-${GA} TC${TC} A${AS} - gemforce ${GEMFORCE_VER} - ${TABLES}"

if [ $s -le 4096 ] && [ $c -le 4096 ]
then
	${GEMFORCE_DIR}/bin/mgquery-omnia -rqpe -Q$QA -G$GA -T$TC -A$AS -f "${TABLE_FILES}" "$s" "$c" | tail -n +40 > ${FOLDER}/$filename".txt"
	echo "$desc" >> ${FOLDER}/$filename".txt"
else
	${GEMFORCE_DIR}/bin/mgquery-omnia -rqe  -Q$QA -G$GA -T$TC -A$AS -f "${TABLE_FILES}" "$s" "$c" | tail -n +40 > ${FOLDER}/$filename".txt"
	echo "$desc" >> ${FOLDER}/$filename".txt"
fi
