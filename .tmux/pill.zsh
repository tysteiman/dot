# Sourced by the status scripts: print one rounded pill segment plus a trailing gap.
#   solid COLOUR ICON TEXT                     — filled with COLOUR, dark text (state worth noticing)
#   pill ICON_COLOUR ICON TEXT [FILL] [TEXT_COLOUR]
# Defaults give a "soft" pill (sumiInk3 fill, fujiWhite text) on the sumiInk0 bar;
# pass a FILL to make a solid, attention-grabbing one. Keep in sync with .tmux.conf.
pill() {
  local fill=${4:-#363646} text=${5:-#dcd7ba} bar=#16161d
  print -rn -- "#[fg=$fill,bg=$bar]"$'\uE0B6'"#[fg=$1,bg=$fill]$2 #[fg=$text]$3#[fg=$fill,bg=$bar]"$'\uE0B4'" "
}

solid() { pill '#16161d' "$2" "$3" "$1" '#16161d' }
