#!/bin/sh
## Installation script for dotfiles
## To be run in "dotfiles" folder

# Wallpaper
[ ! -d ~/.local/share/backgrounds ] && sudo mkdir ~/.local/share/backgrounds # Create backgrounds folder if it doesn't exist
sudo cp -f ./wal/* ~/.local/share/backgrounds/ # Copy wallpaper
echo "Wallpaper written to ~/.local/share/backgrounds/"
nitrogen --set-zoom-fill /.local/share/backgrounds/ # Set wallpaper
cp -f linux/nitrogen/* ~/.config/nitrogen/ # Copy config files

# ZSH
cp -f ./linux/zsh/.zshrc ~/

# Neovim
cp -f ./common/neovim/init.vim ~/.config/nvim/

# Qutebrowser
cp -f ./common/qutebrowser/autoconfig.yml ~/.config/qutebrowser/autoconfig.yml

# i3wm
cp -rf ./linux/i3/ ~/.config/

# Git
cp -f ./common/.gitconfig ~/
