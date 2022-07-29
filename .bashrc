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
        echo " $br"
    fi
}

# PS1='[\u@\h \W]\$ '
# PS1='\e[1m\e[36m\W \e[35m>\e[0m '
PS1='\e[1m\e[36m\W\e[34m$(git_branch) \e[35m\e[0m '

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

# nvm
# source /usr/share/nvm/init-nvm.sh

neofetch
# eval "$(starship init bash)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export DENO_INSTALL="/home/tyler/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
