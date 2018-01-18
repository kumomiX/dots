#!/bin/sh
for f in /usr/share/figlet/*
do
  fs=$(basename $f)
  fname=${fs%%}
  toilet -f $fname $fname
done
