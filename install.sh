#/bin/bash

cat README.md | grep -i "git clone" | bash

ln -s $PWD/.gitconfig ~/
ln -s $PWD/.tmux.conf ~/
ln -s $PWD/.vimrc ~/
ln -s $PWD/.spacemacs ~/
ln -s $PWD/.nanorc ~/
