#!/bin/sh

SAVEDIR=~/screenshots
mkdir -p -- "$SAVEDIR"
FILENAME="$SAVEDIR/$(date +'%Y-%m-%d-%H%M%S_screenshot.png')"
EXPENDED_FILENAME="${FILENAME/#\~/$HOME}"

grim -g "$(slurp)" "$EXPENDED_FILENAME"
swappy -f "$EXPENDED_FILENAME" -o "$EXPENDED_FILENAME"

wl-copy < "$EXPENDED_FILENAME"
notify-send "Screenshot" "File saved as <i>'$FILENAME'</i> and copied to the clipboard." -i "$EXPENDED_FILENAME"
