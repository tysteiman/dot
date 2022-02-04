#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export TERM=xterm
export EDITOR="vim"

git_branch() {
    br=$(git branch 2> /dev/null | grep "* " | sed s/*\ //)
    if [ $br ]; then
        echo " ($br)"
    fi
}

# PS1='[\u@\h \W]\$ '
# PS1='\e[1m\e[36m\W \e[35m>\e[0m '
PS1='\e[1m\e[36m\W\e[34m$(git_branch) \e[35m>\e[0m '

alias ls='ls --color=auto'
alias c="clear"
alias gs="git status"
alias gd="git diff"
alias gds="git diff --staged"
alias gc="git checkout"
alias gb="git branch"
alias gcb="git checkout -b"
alias gcm="git commit -m"
alias ga="git add ."
alias gl="git log --graph"
alias xcc="xclip -selection c"
alias grep="grep --color"
alias ll="ls -lA"
alias duls="ls -A | xargs du -sh"
alias emt="emacsclient -c -nw"

# nvm
source /usr/share/nvm/init-nvm.sh

# rvm
export PATH="$PATH:$HOME/.rvm/bin"

# reapply wal colors to terminal
wal -Renq

neofetch


# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
