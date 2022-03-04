#!/bin/bash

# Install chemacs
git clone https://github.com/plexus/chemacs2.git ~/.emacs.d

if [ ! -d ~/.config ]; then
    mkdir ~/.config
fi

# ln -s $PWD/.emacs.d ~/
ln -s $PWD/.emacs-profiles.el ~/
ln -s $PWD/.ctags ~/
ln -s $PWD/.gitconfig ~/
ln -s $PWD/.nanorc ~/
ln -s $PWD/.tmux.conf ~/
ln -s $PWD/.vimrc ~/
ln -s $PWD/.xinitrc ~/
ln -s $PWD/i3 ~/.config/
ln -s $PWD/kitty ~/.config/
ln -s $PWD/polybar ~/.config/
ln -s $PWD/picom ~/.config/
