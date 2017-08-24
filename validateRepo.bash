#!/bin/bash

# This script will compare the sha1sum of all the jars in this directory and subdirectories 
# aginst the .sha1 file that is in the same directory as the jar for equality
# basicaly "sha1sum foo.jar == foo.jar.sha1"
# it outputs the reulst to a file called "results in the current directory"

declare -i COUNTER=0

if [ -z "$1" ]
  then
    echo "No directory supplied, using current directory"
	jarsToTest="$(find . -name '*.jar')"
else
	jarsToTest="$(find $1 -name '*.jar')"
fi


for file in $jarsToTest; do
	COUNTER=$((COUNTER + 1))
done

echo $COUNTER files found to test
	
for file in $jarsToTest; do
	COUNTER=$((COUNTER -1))
	echo -en "Files remaining: $COUNTER\033[0K\r" 
	if [ -e "$file.sha1" ]; then
		A="$(sha1sum $file | awk '{print $1;}')"
		B="$(cat $file.sha1 | awk '{print $1;}')"
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