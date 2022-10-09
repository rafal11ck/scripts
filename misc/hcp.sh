#!/usr/bin/env sh
#hcp = hardlink copy
#needs fd

( [ "$1" = "" ] || [ "$2" = "" ] ) &&
    printf %b "Script to recursvely make hardlinked clone of directory\n" &&
    printf %b "Usage:\n" &&
    printf %b "\t '$0' source destination\n" &&
    printf %b "\t directory with the same name as source will be created in the destination directory\n" &&
    exit 1

#list dirs
dirlist="$(fd -t d -H --base-directory "$1" | sed 's/\.//')"
basenam="$(basename "$1")"
destdir="$2/$basenam"

# printf %b "0: $0\n"
# printf %b "1: $1\nbasenam=$basenam\n"
# printf %b "2: $2\n"
# printf %b "destdir: $destdir\n"

#recreate directory structure
mkdir "$destdir"
printf %s "$dirlist" | xargs -I{} mkdir "$destdir/{}"

#list and hardlink files
files="$(fd -t f -H --base-directory "$1" | sed 's/\.//')"
printf %s "$files" | xargs -I{} ln "$1/{}" "$destdir/{}"
