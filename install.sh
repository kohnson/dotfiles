#!/bin/sh
## Installation script for dotfiles
## To be run in "dotfiles" folder

# Wallpaper
sudo cp -f common/wal.jpg /usr/share/backgrounds/wal.jpg # Set wallpaper
echo "Wallpaper written to /usr/share/backgrounds/wal.jpg"
nitrogen --set-zoom-fill /usr/share/backgrounds/wal.jpg

