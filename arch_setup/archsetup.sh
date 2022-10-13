#!/bin/sh

#Varables
fonts="noto-fonts oft-ipafont ttf-baekmuk opendesktop-fonts noto-fonts-emoji"
clitools="tmux git neovim"
audio="pipewire pipewire-jack"
filemanagment="pcmanfm "
username="rafal"

#make sure to run as root
if [ "$(whoami)" = "root" ]
then
printf %s "Not root! run this as root\n"
exit 1
fi

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
useradd --create-home --user-group -groups wheel "$username"
echo "Set password for $username"
passwd "$username"
#+end_src

#setup user
su -c "mkdir ~/Desktop ~/Downloads ~/Documents" "$username"
pacman -S "ripgrep emacs fd git"
su -c "git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d ~/.emacs.d/bin/doom install" "$username"
