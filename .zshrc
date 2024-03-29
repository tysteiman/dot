export EDITOR=vim

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
alias gf="git fetch --all"
alias grep="grep --color"
alias lg="lazygit"
alias ls="exa"
alias ll="ls -lahF --git --icons"
alias cat="bat --theme TwoDark"
alias vff="EDITOR=vim ff"
alias vfa="EDITOR=vim fa"
alias kff="EDITOR=kak ff"
alias dcu="docker-compose up"
alias dcud="docker-compose up -d"
alias dcs="docker-compose stop"
alias lv="lvim"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Chef
# export PATH=/opt/chef-workstation/bin/:$PATH

# Our dot scripts
export PATH=~/dot/scripts:$PATH

# Lunarvim bin directory
export PATH=~/.local/bin:$PATH

# Load mm aws functions
source ~/scripts/mm-functions.sh

# SDKMAN - THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
