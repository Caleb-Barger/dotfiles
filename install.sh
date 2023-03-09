#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Install packages from package list.

pacman -S --needed $(comm -12 <(pacman -Slq | sort) <(sort pkglist.txt))

cp .bashrc $HOME/
cp .bash_aliases $HOME/
cp -r .config/ $HOME/
ln -sf -T $HOME/.config/vim/vimrc $HOME/.vimrc

cp -r ./xorg.conf.d/ /etc/X11/
cp -r ./pacman.d/ /etc/pacman.d/
