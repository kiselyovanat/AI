#!/bin/bash
  ./ltc test.l
for i in {1..1000}
do
  python r.py
  ./test
done
