#!/usr/bin/env bash

mkvfile="$(ls *1920*.mkv)"
englishsubs="$(ls *.ass | grep 'eng.ass')"
spanishsubs="$(ls *.ass | grep '[[:digit:]].\.ass')"
echo "INFO********************************"
echo "Video: $mkvfile"
echo "English subs: $englishsubs"
echo "Spanish subs: $spanishsubs"
echo "INFO********************************"

echo "Adding subs..."
ffmpeg -y -loglevel "error" \
-i "$(echo $mkvfile)" \
-i "$(echo $englishsubs)" \
-i "$(echo $spanishsubs)" \
-c copy \
-map 0 -dn -map "-0:s" -map "-0:d"  \
-map "1:0" "-metadata:s:s:0" "language=Eng" "-metadata:s:s:0" "handler_name=English"  "-metadata:s:s:0" "title=English" \
-map "2:0" "-metadata:s:s:1" "language=Spa" "-metadata:s:s:1" "handler_name=Spanish" "-metadata:s:s:1" "title=Spanish" \
 "fixed$mkvfile" \

#removing old files
if [ $? -eq 0 ];then
    rm "$(echo $mkvfile)" "$(echo $englishsubs)" "$(echo $spanishsubs)"
fi
