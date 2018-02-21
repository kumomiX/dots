#!/usr/bin/env python
# -*- coding: utf-8 -*-

import csv
from pathlib import Path

home = str(Path.home())+"/"
rangerlocation = home+".config/ranger/rc.conf"

rang = ""

#First we open the list of folder shortcuts and go down each line adding each in the required syntax to each of the three configs:

with open(home + ".config/scripts/folders.txt", "r") as fold:
    for line in csv.reader(fold, dialect="excel"):
        #Adds the ranger go, tab, move and yank commands:
        rang+=("map g"+line[0]+" cd "+line[1]+"\n")
        rang+=("map t"+line[0]+" tab_new "+line[1]+"\n")
        rang+=("map m"+line[0]+" shell mv %s "+line[1]+"\n")
        rang+=("map Y"+line[0]+" shell cp -r %s "+line[1]+"\n")

with open(rangerlocation, "w") as outrang:
    outrang.write("chain set sort=ctime; set sort_reverse=False\n")
    outrang.write("set preview_images true\n")
    outrang.write(rang)


