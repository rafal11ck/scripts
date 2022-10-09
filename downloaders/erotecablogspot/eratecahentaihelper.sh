#!/usr/bin/env bash
# This script downloads, extracts, and adds subs to mkv file
#
# prerequisites:
# https://github.com/Juvenal-Yescas/mediafire-dl
# 7z with rar support
#
# Usage:
#1. Get link mediafire from ero-teca.blogspot.com
#2. pass it as argument
#3. profit

echo "Downloading... $1"

#download with
mediafire-dl $1
7z e *.rar -Pero-teca.blogspot.com
