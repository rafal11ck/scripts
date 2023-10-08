[ $# -eq 0 ] && echo "Specify path to run script at"

echo "Runnning at $(realpath "$1")"

cd "$(realpath "$1")" || exit

toUnpack="$(ls ./*zip)"

echo "Will unpack:"
echo "$toUnpack"

echo "Exit script to cancel, enter any input to continue."
read -r

for i in ./*zip; do
    printf %b "\nNow unpacking:\t $i"
    printf %b "\n\tUnziping..."
    unzip "$i" >/dev/null || exit
    printf "Done"
    newname="$(basename "$i" .zip).mkv"
    printf %b "\n\tRenaming as $newname\n"
    rename "video.mkv" "$newname" ./video.mkv || rename "video.mp4" "$newname" ./video.mp4 || exit
    printf %b "\n\tRemoving $i\n"
    rm "$i" || exit
done
