#!/bin/bash

echo counting script
for i in `seq 1 100000`;
do	
	if (( $i % 10000 == 0 )) ; 
	then
		echo $i
	fi
done

echo sleeping 8 minutes
sleep 8m

echo done