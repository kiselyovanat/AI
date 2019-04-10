#!/bin/bash
g++ -g -o ogrf ogrf.cpp
./ltc component.l
for i in {1..50}
do
	echo "1 5 5" | ./ogrf
	
	./component >>o55
	sleep 2
done
