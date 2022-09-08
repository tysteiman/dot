#!/bin/bash

sudo pacman -S base-devel

# install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# INSTALL BASE PACKAGES NEEDED (Defaults to my bspwm setup...)
yay -S emacs                  \
    stow                      \
    firefox                   \
    rofi                      \
    pavucontrol               \
    pulseaudio                \
    bspwm                     \
    sxhkd                     \
    picom                     \
    fish                      \
    nerd-fonts-jetbrains-mono \
    kitty                     \
    pcmanfm                   \
    dunst                     \
    libnotify                 \
    feh                       \
    polybar                   \
    ripgrep                   \
    sudo                      \
    openssh                   \
    slack-desktop             \
    flameshot

# make config directory if it doesnt exist
CONF=~/.config
if [ ! -d $CONF ]; then mkdir $CONF; fi

# move bashrc around if it exists
if [ -f ~/.bashrc ]; then mv ~/.bashrc ~/.bashrc.original; fi

# run stow!
stow -v .
