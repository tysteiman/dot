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

# ====================================================================================
#                                      MY STUFF
# ====================================================================================

xrandr --output eDP-1 --mode 1920x1080 --brightness 0 --output HDMI-1-0 --mode 2560x1440 --primary --right-of eDP-1
# xrandr --output eDP-1 --mode 1920x1080 --brightness .8 --primary

# if we want to randomize our saved wallpapers, we could use this...
# feh --bg-scale ~/dot/wallpaper/dark-beach.jpg

# picom -b

xsetroot -solid "#282828"

xmodmap ~/dot/keys.map

# TODO: it would be great to be able to script this to be a little more dynamic. I think maybe creating another script
# that expects a specific variable to be in place maybe WM=i3 startx -- then our script here checks that and based
# on that start different things, etc? I'm really not sure but that would also have to bleed into emacs -- but that
# is going to be a different configuration issue to tackle -- maybe with chemacs or something?


# exec emacs -mm --debug-init
exec i3
