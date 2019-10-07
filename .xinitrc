#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# swap ctrl & capslock
setxkbmap -option ctrl:swapcaps

# launch xfce
# exec startxfce4

# launch KDE
# exec startkde

# i3-gaps
# feh --bg-scale /home/tyler/Downloads/wallpapersden.com_forest-minimal-paint-artwork_7680x4320.jpg
# feh --bg-scale /home/tyler/Downloads/forest-mountains-sunset-cool-weather-minimalism-yn.jpg
feh --bg-scale /home/tyler/Downloads/firewatch.jpg
compton -b
exec i3
