# Pill builders. Output is zsh prompt markup (%F/%K), ready for PROMPT/RPROMPT.
# Same look as the tmux bar: coloured icon cell + soft text cell, rounded caps.
#   _p_pill  ICON_COLOUR ICON TEXT [TEXT_COLOUR]   — two-tone pill
#   _p_solid COLOUR ICON TEXT                      — fully filled (state worth noticing)

# Prompt-escape user-controlled text (branch names, paths): % → %%
_p_esc() { REPLY=${1//\%/%%} }

_p_pill() {
  local c=$1 icon=$2 txt=$3 tc=${4:-${_P[fg]}}
  REPLY="%F{$c}${_P_L}%K{$c}%F{${_P[bar]}} ${icon} %K{${_P[ink3]}}%F{$tc} ${txt} %k%F{${_P[ink3]}}${_P_R}%f "
}

_p_solid() {
  local c=$1 icon=$2 txt=$3
  REPLY="%F{$c}${_P_L}%K{$c}%F{${_P[bar]}} ${icon} ${txt} %k%F{$c}${_P_R}%f "
}
