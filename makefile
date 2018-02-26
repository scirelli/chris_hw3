SHELL := /bin/bash
csv='citibike.csv'

example:
	for i in `seq 1 17`; do echo -n "$$i: "; cut -d, -f$$i $(csv) | head -n 2; echo '';  done;
