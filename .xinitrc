#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

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

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# ====================================================================================
#                                      MY STUFF
# ====================================================================================

# xrandr
xrandr --output eDP-1 --mode 1920x1080 --brightness 0 --output HDMI-1-0 --mode 2560x1440 --primary --right-of eDP-1
# xrandr --output eDP-1 --mode 1920x1080 --brightness 1

# feh --bg-fill ~/dot/wallpaper/palenight-plants.jpg

# picom -b --experimental-backends

xsetroot -solid "#3C435E"

# set keyboard layouts for languages we use
setxkbmap -layout us,iq,tr

# xmodmap (keys)
# xmodmap ~/dot/keys.map

# key repeat
xset r rate 200 50

emacs --daemon

exec bspwm

# exec /home/tyler/proj/home/xcbwm/bin/tinyxcbwm
