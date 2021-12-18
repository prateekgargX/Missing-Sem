#!/usr/bin/env bash

i=1
./rand.sh >out.log 2>err.log

while [[ $? -ne 1 ]];
do
	((i++))
	./rand.sh >>out.log 2>>err.log
done

echo "number of runs : $i"

cat out.log
cat err.log

rm out.*
rm err.*

