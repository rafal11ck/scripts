#!/usr/bin/env sh
#dict weaper wayland

dict "$(wl-paste -p)" 2>&1 | less
