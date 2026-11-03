# ── PATH / env ───────────────────────────────────────────────────────
typeset -U path fpath          # dedupe: nested shells / tmux panes otherwise stack copies
export EDITOR=nvim

source ~/.secrets.sh

export PATH=~/dot/scripts:$PATH           # our dot scripts

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

export PATH=~/.pyenv/shims:$PATH          # pyenv
export PATH="$HOME/.local/bin:$PATH"      # ForgeCode, fd, etc.
export PATH="$PATH:$HOME/.lmstudio/bin"   # LM Studio CLI (lms)
# ~/.cargo/env is already sourced from ~/.zshenv
path=($path)   # -U only dedupes on array assignment; collapse what the PATH= lines stacked

[[ -f ~/.work.sh ]] && ~/.work.sh

# ── Aliases ──────────────────────────────────────────────────────────
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

# ── History: big, deduped, shared live across tmux panes ─────────────
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt extended_history       # timestamps
setopt share_history          # every pane sees every other pane's commands immediately
setopt hist_fcntl_lock        # safe concurrent writes from many panes
setopt hist_ignore_all_dups   # drop older duplicates
setopt hist_ignore_space      # ` cmd` (leading space) stays out of history
setopt hist_reduce_blanks
setopt hist_verify            # `!!` etc. expand into the buffer instead of running blind

# ── Shell options ────────────────────────────────────────────────────
setopt auto_cd                # `..` or `~/proj/foo` alone cds there
setopt auto_pushd pushd_ignore_dups pushd_silent   # `cd -<Tab>` = recent-dir stack
setopt interactive_comments
setopt no_beep
setopt extended_glob
WORDCHARS=${WORDCHARS//[\/=]}  # Ctrl-W / Alt-Backspace stop at / and =

# ── Completion ───────────────────────────────────────────────────────
fpath=(
  /opt/homebrew/share/zsh-completions      # extra completions for ~hundreds of CLIs
  ~/.docker/completions
  $fpath
)
autoload -Uz compinit
# full security scan + dump rebuild at most once a day; otherwise trust the cached dump
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then compinit; else compinit -C; fi
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

setopt complete_in_word always_to_end
# case-insensitive, then fuzzy on separators (`gi-co` → git-commit-...), then substring
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ${XDG_CACHE_HOME:-$HOME/.cache}/zsh/compcache
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors 'di=1;34' 'ln=35' 'so=32' 'pi=33' 'ex=31'
zstyle ':completion:*' menu no                       # fzf-tab draws the menu
zstyle ':completion:*:git-checkout:*' sort false     # keep git's recency order

# ── Prompt (replaces powerlevel10k) — see ~/dot/prompt/prompt.zsh for ZP_* options
source ~/dot/prompt/prompt.zsh

# ── fzf: Ctrl-R history, Ctrl-T files, Alt-C cd ──────────────────────
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS="--layout=reverse --border=rounded --info=inline-right \
--color=fg:#dcd7ba,bg:-1,hl:#7e9cd8,fg+:#dcd7ba,bg+:#2a2a37,hl+:#7fb4ca,gutter:-1 \
--color=border:#54546d,header:#957fb8,info:#727169,marker:#98bb6c,pointer:#d27e99 \
--color=prompt:#957fb8,spinner:#e6c384,query:#dcd7ba"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=plain --line-range=:200 {}'"
export FZF_ALT_C_OPTS="--preview 'eza -1 --color=always --icons=always {}'"
source <(fzf --zsh)

# ── fzf-tab: Tab opens a fuzzy picker over zsh's own completions ────
source /opt/homebrew/share/fzf-tab/fzf-tab.zsh
zstyle ':fzf-tab:*' use-fzf-default-opts yes
zstyle ':fzf-tab:*' switch-group '<' '>'             # cycle groups (e.g. branches vs files)
# fzf-tab sizes the window to the candidate count, so the border + preview box would leave
# room for ~1 row; give it a real minimum like the Ctrl-T picker
zstyle ':fzf-tab:*' fzf-min-height 20
zstyle ':fzf-tab:complete:(cd|z|pushd|__zoxide_z):*' fzf-preview \
  'eza -1 --color=always --icons=always $realpath'
zstyle ':fzf-tab:complete:(nvim|nv|vim|bat|cat|less):*' fzf-preview \
  '[[ -d $realpath ]] && eza -1 --color=always --icons=always $realpath || bat --color=always --style=plain --line-range=:200 $realpath'
zstyle ':fzf-tab:complete:git-(checkout|switch|merge|rebase|log):*' fzf-preview \
  'git log --oneline --graph --color=always -20 $word 2>/dev/null'
zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview \
  'git diff --color=always -- $realpath 2>/dev/null | head -200'

# ── zoxide: `z foo` jumps to the most-used dir matching foo, `zi` = fzf picker
eval "$(zoxide init zsh)"

# ── Keys (emacs mode) ────────────────────────────────────────────────
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search edit-command-line
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
zle -N edit-command-line
# Up/Down search history by what's already typed (`git ⇡` → previous git commands)
bindkey '^[[A' up-line-or-beginning-search   '^[OA' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search '^[OB' down-line-or-beginning-search
bindkey '^P'   up-line-or-beginning-search   '^N'   down-line-or-beginning-search
bindkey '^[[1;5C' forward-word  '^[[1;5D' backward-word   # Ctrl-Right / Ctrl-Left
bindkey '^[[3~' delete-char                                # Delete
bindkey '^X^E' edit-command-line                           # open command in $EDITOR
bindkey '^U'   backward-kill-line                          # like bash, not kill-whole-line

# ── Plugins that wrap zle widgets: keep these LAST, highlighting very last
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#727169'
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=40
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept                            # Ctrl-Space (→ / Ctrl-E also accept)

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
