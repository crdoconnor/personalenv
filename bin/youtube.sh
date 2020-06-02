cd ~/Music/temp
youtube-dl --extract-audio  --audio-quality 160K --audio-format mp3 -l "$1"
notify-send "MP3 created."
