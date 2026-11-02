# Kanagawa palette — keep in sync with the %hidden colours in ~/.tmux.conf.
typeset -gA _P=(
  bar    '#16161d'   # sumiInk0   – text on a coloured fill
  ink    '#2a2a37'   # sumiInk2
  ink3   '#363646'   # sumiInk3   – soft pill fill
  fg     '#dcd7ba'   # fujiWhite
  fg2    '#c8c093'   # oldWhite
  gray   '#727169'   # fujiGray   – muted text
  violet '#957fb8'   # oniViolet  – project / accent
  blue   '#7e9cd8'   # crystalBlue
  pink   '#d27e99'   # sakuraPink
  green  '#98bb6c'   # springGreen
  yellow '#e6c384'   # carpYellow
  red    '#e46876'   # waveRed
  orange '#d97757'   # Claude orange
)

# Rounded powerline caps + Nerd Font icons.
typeset -g _P_L=$'\uE0B6' _P_R=$'\uE0B4'
typeset -gA _I=(
  folder   $'\uF07B'
  branch   $'\uE0A0'
  clock    $'\uF017'
  fail     $'\uF00D'
  python   $'\uE73C'
  node     $'\uE718'
  db       $'\uF1C0'
  ssh      $'\uF0C1'
  claude   '✻'
  bell     $'\uF0F3'
  warn     $'\uF071'
  check    $'\uF00C'
)
