# export PS1='%1d > '
export PS1='%F{blue}%1d %F{magenta}>%f '

export EDITOR=nvim

alias c="clear"

# Git
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

alias grep="grep --color"
alias lg="lazygit"
alias ls="eza"
alias ll="ls -lahF --git --icons"
# alias cat="bat"
# alias vff="EDITOR=vim ff"
# alias vfa="EDITOR=vim fa"
# alias kff="EDITOR=kak ff"
alias nv="nvim"
# alias nvz="nvim ~/.zshrc"
# alias hh="tail -r ~/.zsh_history | fzf --reverse --border --height 20 | zsh"
alias now="date +%m-%d-%y-%H-%M"
# alias tn="tmux new -s"
# alias ddg="links duckduckgo.com"
# alias npm-legacy="npm install --verbose --legacy-peer-deps"
# alias nvim-clear-cache="rm -rf ~/.config/nvim/lazy-lock.json && find ~/.local -type d -name 'nvim' | xargs rm -rf"
# alias fsc="fscripts"
# alias sed="sed --follow-symlinks"
# alias jpkg="mvn clean package -DskipTests"
# alias jinstall="mvn install -DskipTests"
alias ca="cursor-agent"

alias irb="irb --noautocomplete"
alias rb="rbenv"

alias nvimmake="CMAKE_BUILD_TYPE=Release make"

source ~/.secrets.sh

# Our dot scripts
export PATH=~/dot/scripts:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# pyenv
export PATH=~/.pyenv/shims:$PATH
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/tyler/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
#
. "$HOME/.cargo/env"
export PATH="$HOME/.local/bin:$PATH"
