#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# reload X settings
xrdb -merge ~/.Xresources &

# set wallpaper
feh --bg-scale ~/Pictures/wallpaper.jpg &

# start network manager applet
nm-applet &

exec i3
