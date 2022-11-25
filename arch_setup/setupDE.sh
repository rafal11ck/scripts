#install basic stuff
pacman -S openssh neovim tmux

#install
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
