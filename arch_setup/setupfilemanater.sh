#!/usr/bin/env sh


packages="gvfs-mtp gvfs-gphoto2 gvfs-smb"
thumbnailers="tumbler webp-pixbuf-loader evince ffmpegthumbnailer freetype2 libgsf"

pacman -S $packages $thumbnailers pcmanfm
