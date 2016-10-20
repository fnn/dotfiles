#!/bin/bash
scrot /tmp/screen.png
convert /tmp/screen.png -modulate 80,70 -scale 12.5% -scale 800% /tmp/screen.png
convert /tmp/screen.png $HOME/dotfiles/i3/.i3/zblock.png -gravity center -composite -matte /tmp/screen.png
i3lock -u -i /tmp/screen.png
rm /tmp/screen.png
