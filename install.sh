#!/bin/bash

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/plexus/chemacs2 ~/.emacs.d

ln -s $PWD/.ctags ~/
ln -s $PWD/.gitconfig ~/
ln -s $PWD/.nanorc ~/
ln -s $PWD/.tmux.conf ~/
ln -s $PWD/.vimrc ~/
ln -s $PWD/.xinitrc ~/
ln -s $PWD/.emacs.d/emacs-profiles.el ~/
ln -s $PWD/i3 ~/.config/i3
