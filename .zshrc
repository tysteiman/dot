# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export EDITOR=vim

alias c="clear"
alias gs="git status"
alias gd="git diff"
alias gds="git diff --staged"
alias gc="git checkout"
alias gb="git branch"
alias gcb="git checkout -b"
alias gcm="git commit -m"
alias gacm="git add . && git commit -m"
alias ga="git add ."
alias gl="git log --graph --decorate"
alias gf="git fetch --all"
alias grep="grep --color"
alias lg="lazygit"
alias ls="eza"
alias ll="ls -lahF --git --icons"
alias cat="bat"
alias vff="EDITOR=vim ff"
alias vfa="EDITOR=vim fa"
alias kff="EDITOR=kak ff"
alias dcu="docker-compose up"
alias dcud="docker-compose up -d"
alias dcs="docker-compose stop"
alias lv="lvim"
alias nnvim="nvim -u NONE"
alias nv="nvim"
alias nvz="nvim ~/.zshrc"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Chef
# export PATH=/opt/chef-workstation/bin/:$PATH

# Our dot scripts
export PATH=~/dot/scripts:$PATH

# Doom Emacs
export PATH=~/.config/emacs/bin:$PATH

# Lunarvim bin directory
export PATH=~/.local/bin:$PATH

# Load mm aws functions
source ~/scripts/mm-functions.sh

# SDKMAN - THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

if [[ -f ~/.secrets.sh ]]; then
  source ~/.secrets.sh
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
