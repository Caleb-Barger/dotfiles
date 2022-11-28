#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

cp -r .config/ $HOME/
ln -sf -T $HOME/.config/vim/vimrc $HOME/.vimrc

cp -r ./xorg.conf.d/ /etc/X11/
