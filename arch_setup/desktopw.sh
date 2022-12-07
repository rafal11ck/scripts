#install basic stuff
#add user to i2c so ddcutil works
basic="openssh fakeroot rust pkgconfig tar dictd gitui man-db which ddcutil ripgrep fd find"

tuiclitools="neovim tmux btop"

polkit = "polkit-gnome"

doas pacman -Syu --needed $basic $tuiclitools $polkit

#install AUR helper\
! command -v paru && (git clone https://aur.archlinux.org/paru-bin;cd paru-bin ; yes | makepkg -si )

#Install command alias to aur helper
install="paru -Syu --needed"

fonts="noto-fonts otf-ipafont ttf-baekmuk opendesktop-fonts noto-fonts-emoji ttf-iosevka-nerd ttf-liberation"

audio="pipewire pipewire-jack wireplumber pipewire-pulse pipewire-alsa alsa-utils"

$install --needed $fonts $audio

#basic stuff for wayland xorg-wayland
$waylandUtils wl-clipboard

#Hyprland libs
archwikilibs="gtk3 gtk4 qt5-wayland qt6-wayland qt5ct clutter glfw-wayland"
hyprlandlibs="qt5-wayland qt5ct libva nvidia-vaapi-driver-git wlroots xorg-xwayland"

$install $hyprlandlibs $archwikilibs

#Wayland apps
$install foot pcmanfm-gtk3 firefox tofi discord keepassxc gvfs

$install papirus-icon-theme pop-gtk-theme

$install autoconf texinfo
#$install emacs-pgtk-git

$install git ripgrep fd find texlive-most
#git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
#~/.emacs.d/bin/doom install
