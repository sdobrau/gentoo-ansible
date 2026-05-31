#!/bin/bash

# https://github.com/hyprwm/hyprpaper/issues/108#issuecomment-1893174941
directory="/home/sdobrau/media/wallpaperz"
monitor=`hyprctl monitors | grep Monitor | awk -F"\n" '{print $2}'`

if [ -d "$directory" ]; then
  random_background=$(find "${directory}" -type f | shuf -n 1)

  hyprctl hyprpaper unload all
  hyprctl hyprpaper preload $random_background
  hyprctl hyprpaper wallpaper "$monitor, $random_background"

fi
