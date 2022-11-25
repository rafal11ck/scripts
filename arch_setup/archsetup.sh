#!/bin/sh

#Varables
username="rafal"

pacman -S which

# replace /bin/sh with dash
pacman -S dash
rm /bin/sh
ln -s "$(which dash)" "/bin/sh"

#replace sudo with does
pacman -R sudo
pacman -S doas
echo "permit persist :wheel as root" >> /etc/doas.conf
ln -s "$(which doas)" /bin/sudo;

# add user
useradd --create-home --user-group --groups wheel "$username"
echo "Set password for $username"
passwd "$username"
#+end_src
