#install basic stuff
doas pacman -Syu --needed openssh neovim tmux fakeroot rust pkgconfig tar dict

#install AUR helper\
doas sudo pacman -S --needed base-devel fakeroot rust pkgconfig
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

paru -Syu --needed noto-fonts oft-ipafont ttf-baekmuk opendesktop-fonts noto-fonts-emoji

paru -Syu --needed pipewire

paru -Syu --needed foot pcmanfm-gtk3

paru -Syu emacs-pgtk-git

paru -Syu --needed git ripgrep fd find
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
~/.emacs.d/bin/doom install
