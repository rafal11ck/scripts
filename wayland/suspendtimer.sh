#!/usr/bin/env sh
#Has to run in background

swayidle -w \
    timeout 600 'systemctl suspend' \
    before-sleep ""$HOME"/.scripts/wayland/lockscreen.sh"

# before-sleep 'swaylock --scaling fit --image /home/rafal/Pictures/wallpapers/arch-linux/archlinux-logo-light-no-tm.png --ring-color 8218c4 --key-hl-color 3e0c60'
