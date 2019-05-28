#!/bin/bash
./ltc test.l
for i in {1..100}
do
	python r.py
	./test >>comp85rand
	sleep 2
done
