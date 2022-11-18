#!/usr/bin/env sh
#Screenshoot taking for wayland
#Reqires: swappy grim slurp

grim -g "$(slurp)" - | swappy -f -
