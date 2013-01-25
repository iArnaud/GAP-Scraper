#!/usr/bin/env python

import csv
import sqlite3 as lite

con = lite.connect('gap_data.db')
with open('export.csv', 'U') as f:
    reader = csv.reader(f, delimiter=',')
    for row in reader:
        if "List:" in row[0]:
           country = row[0][6:]
           #print country
        elif "Region:" in row[0]:
            pass
        elif "Number of Placements:" in row[0]:
            placements = int(row[0][22:])
        elif "Publisher" in row[0]:
            pass
        elif "GDN" in row[0] and "::" not in row[1]:
            with con:
                cur = con.cursor();
                query = "INSERT INTO placements VALUES(\'" + country.replace("\'","\'\'") + "\',\'" + row[1] + "\',\'" + row[2].replace("\'","\'\'") + "\'," + row[3].replace(',', '').replace('--','NULL') + "," + row[4].replace('%', '') + ")"
                print query.decode('unicode-escape')
                cur.execute(query.decode('unicode-escape'))

        else:
            pass