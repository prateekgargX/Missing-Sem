#!/usr/bin/env bash

i=1
./rand.sh >out.txt 2>err.txt

if [[ $? -eq 1 ]]; then
	echo "Number of runs $i"
	cat ./out.txt
	cat ./err.txt
else
	./rand.sh >>out.txt 2>err.txt
	((i++))
fi


echo "Number of times it ran $i"


