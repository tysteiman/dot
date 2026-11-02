# Custom prompt — minimal, Kanagawa pills, tmux-aware. Replaces powerlevel10k.
#   source ~/dot/prompt/prompt.zsh
# Options (set before sourcing):
#   ZP_STYLE=simple     plain prompt (auto-selected on a bare TTY)
#   ZP_TRANSIENT=0      keep the full prompt in scrollback instead of collapsing to ❯
#   ZP_VI=1             vi keybindings (the ❯/❮ glyph tracks the mode either way)
#   ZP_DIVIDER=0        no dark rule + spacing between prompts
#   ZP_GIT_IN_TMUX=0    hide the git pill inside tmux (the status bar already shows it)

[[ -o interactive ]] || return
typeset -g _ZP_DIR=${${(%):-%x}:A:h}

if [[ ${ZP_STYLE:-} == simple || $TERM == linux || $TERM == dumb ]]; then
  PROMPT='%F{blue}%1d %F{magenta}>%f '
  return
fi

[[ $COLORTERM == (truecolor|24bit) || -n $TMUX ]] || zmodload zsh/nearcolor 2>/dev/null

source $_ZP_DIR/colors.zsh
source $_ZP_DIR/pill.zsh
for _f in $_ZP_DIR/modules/*.zsh; do source $_f; done; unset _f

: ${ZP_DIVIDER:=1} ${ZP_TRANSIENT:=1} ${ZP_GIT_IN_TMUX:=1}
typeset -g _p_root= _p_sess= _p_claude= _p_env= _p_status= _p_char= _p_keymap= _p_left= _p_git=
typeset -gi _p_rc=0 _p_transient=0 _p_seen=0

# Assemble PROMPT/RPROMPT from the cached pieces; cheap, so the async git callback and
# vi-mode switches can call it freely.
_p_render() {
  local dir git ssh=
  _p_mod_dir; dir=$REPLY
  git=
  if [[ $ZP_GIT_IN_TMUX == 1 || -z $TMUX ]]; then _p_mod_git; git=$REPLY; fi
  if [[ -n $SSH_CONNECTION ]]; then
    _p_solid ${_P[pink]} ${_I[ssh]} '%n@%m'; ssh=$REPLY
  fi
  _p_mod_char
  PROMPT="${ssh}${dir}${git}${_p_char} "
  RPROMPT="${_p_status}${_p_env}${_p_claude}"
}

# `clear` wipes the screen, so the next prompt is the first on it: skip its divider
clear() { command clear "$@"; _p_seen=0 }

_p_precmd() {
  local rc=$?                       # must be first: the last command's status
  _p_transient=0
  # blank line + dark rule between a command's output and the next prompt (not before the first)
  if (( ZP_DIVIDER && _p_seen )); then
    print -Pr -- $'\n'"%F{${_P[ink3]}}${(l:COLUMNS::─:)}%f"
  fi
  _p_seen=1
  _p_find_root
  _p_mod_tmux
  _p_mod_status $rc
  _p_mod_env
  _p_render
  _p_git_refresh
}

# ── zle: vi-mode indicator + transient prompt ───────────────────────
_p_zle_init()   { _p_keymap=main; _p_render }
_p_zle_keymap() { _p_keymap=$KEYMAP; _p_render; zle reset-prompt }
_p_zle_finish() {
  (( ZP_TRANSIENT )) || return
  _p_transient=1
  PROMPT="${_p_char} " RPROMPT=
  zle reset-prompt
}
zle -N zle-line-init     _p_zle_init
zle -N zle-keymap-select _p_zle_keymap
zle -N zle-line-finish   _p_zle_finish

(( ${ZP_VI:-0} )) && bindkey -v

autoload -Uz add-zsh-hook
add-zsh-hook -d precmd _p_precmd 2>/dev/null
add-zsh-hook preexec _p_preexec
precmd_functions=(_p_precmd ${precmd_functions:#_p_precmd})   # first, to catch $?
