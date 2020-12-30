#!/bin/bash

#first parameter is base url, final / included
#second parameter is the wordlist

outFile="./trav_out.txt"
touch $outFile

urlBase=$1
echo "----------------------------------------------------------------------------------------------"

echo "url base is: "$urlBase

echo "----------------------------------------------------------------------------------------------"

echo "response codes:"

while read line; do
	#echo $line
	responseCode=$(curl -s -I $urlBase$line | grep HTTP | awk '{split($0,a," "); print a[2]}')

	#if [[ ! $responseCode =~ 4** ]]
	#then
		echo "[" $responseCode "]" $line #>> $outFile
	#fi
done <$2
