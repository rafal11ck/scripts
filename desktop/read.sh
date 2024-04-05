#!/usr/bin/env sh
#Read using speech dispatcher

spd-say -C

buff="$(wl-paste -p)"

lang="$(spd-say -L | tail -n +2 | awk '{ print $2 }' | tofi)"

spd-say -l "$lang" "$buff" 2>&1
