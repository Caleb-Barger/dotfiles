#!/bin/bash

# Check running root.

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

HOME_DIR=/home/${SUDO_USER}

# Install packages from list

pacman -S --needed $(comm -12 <(pacman -Slq | sort) <(sort pkglist.txt))

# Install files

cp .bashrc $HOME_DIR/
cp .bash_aliases $HOME_DIR/
cp -r .config/ $HOME_DIR/
cp -f ./pkglist.txt /etc/pkglist.txt
cp -r ./xorg.conf.d/ /etc/X11/
cp -r ./pacman.d/ /etc/pacman.d/

ln -sf -T $HOME_DIR/.config/vim/vimrc $HOME_DIR/.vimrc

# Now link from installed files to this directory so, I don't have to update in 2 places.

ln -Pf $HOME_DIR/.bashrc ./.bashrc
ln -Pf $HOME_DIR/.bash_aliases ./.bash_aliases
ln -Pf $HOME_DIR/.config/vim/vimrc ./.config/vim/vimrc
ln -Pf $HOME_DIR/.config/i3status/config ./.config/i3status/config
ln -Pf $HOME_DIR/.config/i3/config ./.config/i3/config
ln -Pf $HOME_DIR/.config/nvim/init.vim ./.config/nvim/init.vim
ln -Pf $HOME_DIR/.config/tmux/tmux.conf ./.config/tmux/tmux.conf
