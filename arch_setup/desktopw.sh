#install basic stuff
#add user to i2c so ddcutil works
basic="openssh fakeroot rust pkgconfig tar dictd gitui man-db which ddcutil ripgrep fd find"

tuiclitools="neovim tmux btop"

doas pacman -Syu --needed $basic $tuiclitools

#install AUR helper\
! command -v paru && (git clone https://aur.archlinux.org/paru-bin;cd paru-bin ; yes | makepkg -si )

#Install command alias to aur helper
install="paru -Syu --needed"

fonts="noto-fonts otf-ipafont ttf-baekmuk opendesktop-fonts noto-fonts-emoji ttf-iosevka-nerd"

audio="pipewire pipewire-jack wireplumber pipewire-pulse pipewire-alsa alsa-utils"

$install --needed $fonts $audio

#basic stuff for wayland xorg-wayland
$install wl-clipboard

#Hyprland libs
archwikilibs="gtk3 gtk4 qt5-wayland qt6-wayland qt5ct clutter glfw-x11"
$install qt5-wayland qt5ct libva nvidia-vaapi-driver-git wlroots xorg-xwayland $archwikilibs

#Wayland apps
$install foot pcmanfm-gtk3 firefox tofi discord keepassxc

$install papirus-icon-theme pop-gtk-theme

$install autoconf texinfo
#$install emacs-pgtk-git

#$install git ripgrep fd find texlive-full
#git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
#~/.emacs.d/bin/doom install
