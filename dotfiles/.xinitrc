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

# start network manager applet
nm-applet &

# set wallpaper
exec feh --bg-scale ~/Pictures/wallpaper.jpg &

# use xbindkeys
xbindkeys

exec i3
