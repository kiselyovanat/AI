#!/bin/bash
./ltc test.l
for i in {1..5}
do
	echo "3 11 11" | ./ogrf
	./test >>setBig
	sleep 2
done
