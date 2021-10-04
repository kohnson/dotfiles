#!/bin/sh
## Installation script for dotfiles
## To be run in "dotfiles" folder

# Wallpaper
[ ! -d /usr/share/backgrounds ] && sudo mkdir /usr/share/backgrounds # Create backgrounds folder if it doesn't exist
sudo cp -f ./common/wal.jpg /usr/share/backgrounds/wal.jpg # Set wallpaper
echo "Wallpaper written to /usr/share/backgrounds/wal.jpg"
nitrogen --set-zoom-fill /usr/share/backgrounds/wal.jpg
cp -f ./linux/nitrogen/* ~/.config/nitrogen/

# ZSH
cp -f ./linux/zsh/.zshrc ~/

# Neovim
cp -f ./common/neovim/init.vim ~/.config/nvim/

# Qutebrowser
cp -f ./common/qutebrowser/autoconfig.yml ~/.config/qutebrowser/autoconfig.yml
