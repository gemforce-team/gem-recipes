#!/bin/bash

source "$(dirname $0)/base.sh"

s=$1
c=$2
table1=$3
table2=$4
table3=$5

#QA=2
#GA=2.5
QA=8
GA=1
TC=120
AS=${6:-60} # 60 if unset

FOLDER=gccs/killgem-omnia
TABLES="${table1},${table2},${table3}"
TABLE_FILES="${TABLE_DIR}/${table1},${TABLE_DIR}/${table2},${TABLE_DIR}/${table3}"

echo "$s - $c"
filename="ko"$(printf "%0.4d-%0.6d" $s $c)
if [[ $AS != 60 ]]; then
	filename+="-A${AS}"
fi
desc="$filename - AMPS${QA}-${GA} TC${TC} A${AS} - gemforce ${GEMFORCE_VER} - ${TABLES}"

if [ $s -le 4096 ] && [ $c -le 4096 ]
then
	${GEMFORCE_DIR}/bin/kgquery-omnia -rqpe -Q$QA -G$GA -T$TC -A$AS -f "${TABLE_FILES}" "$s" "$c" | tail -n +46 > ${FOLDER}/$filename".txt"
	echo "$desc" >> ${FOLDER}/$filename".txt"
else
	${GEMFORCE_DIR}/bin/kgquery-omnia -rqe  -Q$QA -G$GA -T$TC -A$AS -f "${TABLE_FILES}" "$s" "$c" | tail -n +46 > ${FOLDER}/$filename".txt"
	echo "$desc" >> ${FOLDER}/$filename".txt"
fi
