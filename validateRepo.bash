#!/bin/bash
declare -i COUNTER=0

jarsToTest="$(find . -name '*.jar')"
for file in $jarsToTest; do
	#echo item: $file
	COUNTER=$((COUNTER + 1))
done

echo $COUNTER files found to test
	
for file in $jarsToTest; do
	COUNTER=$((COUNTER -1))
	echo -en "Files remaining: $COUNTER\033[0K\r" 
	#echo $file.sha1 >> shaDigest
	#sha1sum $file | awk '{print $1;}' >> shaDigest
	if [ -e "$file.sha1" ]; then
		A="$(sha1sum $file | awk '{print $1;}')"
		B="$(cat $file.sha1 | awk '{print $1;}')"
		#echo $A $B
		if [ "$A" != "$B" ]; then
			echo $file does not validate against included sha1 file >> results
			echo "  calculated hash: $A" >> results
			echo "  sha listed hash: $B" >> results
			echo "" >> results
		fi
	else
		echo $file does not have an matching sha1 file >> results
		echo "" >> results
 	fi
done