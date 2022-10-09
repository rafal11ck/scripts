#!/bin/sh
for i in *.flac;
    do
        printf %s "$(echo "$i" | sed 's/\.flac//g') (" ;
        printf %b "$(mediainfo "$i" | sed -nE 's/Duration.*: ([0-9]*) ([a-z]*) ([0-9]*).*/\1:\3/p'))\n" | tail -n 1 ;
done
