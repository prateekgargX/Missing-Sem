#!/usr/bin/env bash

i=1
./$1 >out.log 2>err.log

while [[ $? -ne 1 ]];
do
	((i++))
	./$1 >>out.log 2>>err.log
done

cat out.log
cat err.log

rm out.*
rm err.*

echo "number of runs : $i"
