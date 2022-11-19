#!/usr/bin/env sh
#Has to run in background

swayidle -w \
    timeout 600 'systemctl suspend' \
    before-sleep "$HOME/.scripts/wayland/lockscreen.sh"
