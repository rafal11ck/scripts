#install basic stuff
basic="openssh fakeroot rust pkgconfig tar dictd gitui mandb which ddcutil"

tuiclitools="neovim tmux"

pacman -Syu --needed "$basic" "$tuiclitools"

#install AUR helper\
git clone https://aur.archlinux.org/paru-bin.git &&
cd paru &&
makepkg -si &&

#Install command alias to aur helper
install="paru -Syu --needed"

fonts="noto-fonts otf-ipafont ttf-baekmuk opendesktop-fonts noto-fonts-emoji ttf-iosevka-nerd"

audio="pipewire pipewire-jack wireplumber"

$install --needed "$fonts" "$audio"

#Wayland apps
$install foot pcmanfm-gtk3 firefox

$install autoconf makeinfo
$install emacs-pgtk-git

$install git ripgrep fd find texlive-full
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
~/.emacs.d/bin/doom install
