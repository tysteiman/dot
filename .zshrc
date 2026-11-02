# Added by ForgeCode installer
export PATH="/Users/tyler/.local/bin:$PATH"
export EDITOR=nvim

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
alias grep="grep --color"
alias lg="lazygit"
alias lgs="lazygit status"
alias lgb="lazygit branch"
alias lgl="lazygit log"
alias lgh="lazygit stash"
alias ls="eza"
alias ll="ls -lahF --git --icons always"
alias cat="bat"
alias nv="nvim"
alias now="date +%m-%d-%y-%H-%M"
alias tn="tmux new -s"
alias ca="cursor-agent"
alias cl="claude --dangerously-skip-permissions"
alias cla="cl agents"
alias clr="cl -r"
alias irb="irb --noautocomplete"
alias rb="rbenv"
alias nvimmake="CMAKE_BUILD_TYPE=Release make"
alias mb="pmset -g batt"
alias dps="docker ps"
alias updates="brew update && brew upgrade -y && brew cleanup && brew autoremove && cl update"
alias rn="ranger"
alias srcz="source ~/.zshrc"
alias vimz="vim ~/.zshrc"

source ~/.secrets.sh

# Our dot scripts
export PATH=~/dot/scripts:$PATH

# nvm, lazily: put the default node on PATH directly (fast) and only source nvm.sh
# the first time `nvm` itself is called — sourcing it costs ~300ms per shell.
export NVM_DIR="$HOME/.nvm"
_nvm_default_bin() {
  setopt local_options numeric_glob_sort null_glob
  local a
  [[ -r $NVM_DIR/alias/default ]] && read -r a < $NVM_DIR/alias/default
  a=${a#v}
  local -a dirs=($NVM_DIR/versions/node/v${a}(|.*)(/On))
  [[ -n $a && -n $dirs ]] && REPLY=${dirs[1]}/bin
}
if _nvm_default_bin; then
  export PATH="$REPLY:$PATH"
  nvm() {
    unfunction nvm
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
    [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
    nvm "$@"
  }
else   # unusual alias (lts/*, node, ...): fall back to the eager load
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
fi
unfunction _nvm_default_bin

# pyenv
export PATH=~/.pyenv/shims:$PATH
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/tyler/.docker/completions $fpath)
autoload -Uz compinit
setopt extended_glob
# full security scan + dump rebuild at most once a day; otherwise trust the cached dump
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then compinit; else compinit -C; fi
# End of Docker CLI completions
#
. "$HOME/.cargo/env"
export PATH="$HOME/.local/bin:$PATH"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/tyler/.lmstudio/bin"
# End of LM Studio CLI section

if [[ -f ~/.work.sh ]]; then
  ~/.work.sh
fi

# Prompt (replaces powerlevel10k) — see ~/dot/prompt/prompt.zsh for options (ZP_*)
source ~/dot/prompt/prompt.zsh

# # >>> forge initialize >>>
# # !! Contents within this block are managed by 'forge zsh setup' !!
# # !! Do not edit manually - changes will be overwritten !!
# 
# # Add required zsh plugins if not already present
# if [[ ! " ${plugins[@]} " =~ " zsh-autosuggestions " ]]; then
#     plugins+=(zsh-autosuggestions)
# fi
# if [[ ! " ${plugins[@]} " =~ " zsh-syntax-highlighting " ]]; then
#     plugins+=(zsh-syntax-highlighting)
# fi
# 
# # Load forge shell plugin (commands, completions, keybindings) if not already loaded
# if [[ -z "$_FORGE_PLUGIN_LOADED" ]]; then
#     eval "$(forge zsh plugin)"
# fi
# 
# # Load forge shell theme (prompt with AI context) if not already loaded
# if [[ -z "$_FORGE_THEME_LOADED" ]]; then
#     eval "$(forge zsh theme)"
# fi
# 
# # Editor for editing prompts (set during setup)
# # To change: update FORGE_EDITOR or remove to use $EDITOR
# export FORGE_EDITOR="vim"
# # <<< forge initialize <<<
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
