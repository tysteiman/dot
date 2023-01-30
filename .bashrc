#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export TERM=xterm-256color
export EDITOR="kak"
export FZF_DEFAULT_OPTS="--reverse --border=rounded"

# just put all our scripts in our path instead of symlinking every new script we make...
export PATH=$HOME/dot/scripts:$PATH
export PATH=$HOME/.local/bin:$PATH

git_branch() {
    br=$(git branch 2> /dev/null | grep "* " | sed s/*\ //)
    if [ $br ]; then
        echo " $br"
    fi
}

# NOTE customized weaponizations break TRAMP connections if we're not careful...
# TRAMP does regex matches for "typical" prompts it expects to get back from the server.
PS1='[\u@\h \W]\$ '
# PS1='\e[1m\e[36m\W \e[35m>\e[0m '
# PS1='\e[31m[SSH]: \e[1m\e[36m\W\e[34m$(git_branch) \e[35m>\e[0m '

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
alias gl="git log --graph --decorate"
alias gpa="git push --all"
alias grep="grep --color"
alias ll="ls -lAh"
alias la="ls -A"
alias duls="ls -A | xargs du -sh"

