#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

git_branch() {
    br=$(git branch 2> /dev/null | grep "* " | sed s/*\ //)
    if [ $br ]; then
        echo " ($br)"
    fi
}

# PS1='[\u@\h \W]\$ '
# PS1='\e[1m\e[36m\W \e[35m>\e[0m '
PS1='\e[1m\e[32m\W\e[34m$(git_branch) \e[31m>\e[0m '

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
alias gl="git log"
alias xcc="xclip -selection c"
alias grep="grep --color"
alias ll="ls -lAtrh"
alias duls="ls -A | xargs du -sh"

# nvm
source /usr/share/nvm/init-nvm.sh

# rvm
export PATH="$PATH:$HOME/.rvm/bin"