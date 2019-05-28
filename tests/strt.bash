#!/bin/bash
./ltc test.l
for i in {1..20}
do
	echo "3 10 8" | ./ogrf
	./test >> comp108ogrf
	sleep 2
done
