#!/bin/bash
URL=$(xclip -out)
notify-send "Downloading video $URL..."
TMPFOLDER=/tmp/youtube-$RANDOM/
echo $TMPFOLDER
mkdir -p $TMPFOLDER
cd $TMPFOLDER
youtube-dl $URL
VIDEO=$(ls)
notify-send "Download of video complete at $VIDEO..."
cd $TMPFOLDER
vlc $VIDEO
echo "Hit enter to continue..."
read
