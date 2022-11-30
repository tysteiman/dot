#!/bin/bash
#
# --------------------------------------------------------------------------------------------------
#
# Script to install arch environment after installing arch itself. This script will install a window
# manager, xorg, firefox, terminal, emacs, font(s), etc... the stuff i install almost every time
# when installing arch for work/daily use.
#
# --------------------------------------------------------------------------------------------------

# install base-devel needed to run makepkg
sudo pacman -S base-devel

# install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# go back to dot root and remove tmp yay dir
cd ..
rm -rf yay

# INSTALL BASE PACKAGES NEEDED (Defaults to my bspwm setup for work...)
yay -S emacs                  \
    cmake                     \
    vim                       \
    tmux                      \
    ispell                    \
    stow                      \
    firefox                   \
    xorg                      \
    xorg-xinit                \
    bspwm                     \
    sxhkd                     \
    docker                    \
    docker-compose            \
    aws-cli                   \
    htop                      \
    rofi                      \
    pavucontrol               \
    pulseaudio                \
    fish                      \
    xclip                     \
    nerd-fonts-jetbrains-mono \
    kitty                     \
    pcmanfm                   \
    dunst                     \
    libnotify                 \
    feh                       \
    polybar                   \
    ripgrep                   \
    openssh                   \
    slack-desktop             \
    isync                     \
    mu                        \
    flameshot

# make config directory if it doesnt exist
CONF=~/.config
if [ ! -d $CONF ]; then mkdir $CONF; fi

# move bashrc around if it exists
if [ -f ~/.bashrc ]; then mv ~/.bashrc ~/.bashrc.original; fi

# run stow!
stow -v .

# launch emacs daemon to install all packages
emacs --daemon
