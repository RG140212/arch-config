# run X when logging on to tty 1
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
