#!/bin/sh
rm -rf "$HOME/dl/emacs"
git clone --depth=1 https://github.com/emacs-mirror/emacs "$HOME/dl/emacs"
cd "$HOME/dl/emacs" || exit
./autogen.sh
./configure --enable-link-time-optimization --with-native-compilation --with-imagemagick --with-json --without-mailutils --with-tree-sitter --with-small-ja-dic
make -j6 -l6
sudo make install
notify-send "Emacs Compiled"
