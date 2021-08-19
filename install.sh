#!/bin/sh
## Installation script for dotfiles
## To be run in "dotfiles" folder

# Wallpaper
sudo cp -f common/wal.jpg /usr/share/backgrounds # Set wallpaper
if ! type "nitrogen" > /dev/null
then
	nitrogen --set-auto /usr/share/backgrounds/wal.jpg
else
	echo "You may need to set your wallpaper manually."
fi # Set with nitrogen
