#!/bin/bash
./ltc test.l
for i in {1..50}
do
	python r.py
	./test >>setBig102356
	sleep 2
done
