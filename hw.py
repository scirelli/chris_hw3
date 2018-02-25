#!/usr/local/bin/python3

import functools
import pandas as pd

dataFile = './citibike.csv'
df = pd.read_csv(dataFile)
rows = df.values.tolist()

def countYearsReducer():
	d = {}
	
	def fnc(year, year2):
		if(type(year).__name__ != 'dict'):
			d[str(year)] = 1
		
		strYear = str(year2)
		if( strYear in d ):
			d[strYear] = d[strYear] + 1;
		else:
			d[strYear] = 1

		return d 
	return fnc

#print(df['birth_year'])
result = functools.reduce(countYearsReducer(), df['birth_year'])
print(result)
