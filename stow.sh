#!/bin/bash

stow ranger

stow nvim

stow i3

rm ~/.zshrc
stow zsh

stow urxvt

sudo rm /etc/X11/xdm/Xresources
sudo stow -t / xdm
