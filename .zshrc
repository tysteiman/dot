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
alias ni="nix-env --install"
alias installed="nix-env --query --installed"
alias generations="nix-env --list-generations"
alias ctags="$HOME/.nix-profile/bin/ctags"
alias ls="exa"
alias ll="ls -lahF --git --icons"
alias cat="bat --theme TwoDark"
alias vff="EDITOR=vim ff"
alias vfa="EDITOR=vim fa"
alias kff="EDITOR=kak ff"
alias v="$EDITOR"

export PATH=$HOME/dot/scripts:$PATH
export EDITOR=vim

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
# End Nix
