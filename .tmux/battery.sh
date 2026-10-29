#!/bin/zsh
# tmux status pill: battery icon + percentage (macOS). Prints nothing if there's no battery.
# Green while charging, red below 20%, yellow below 40%, soft grey otherwise.
export LC_ALL=en_US.UTF-8   # needed to emit the Nerd Font glyphs when tmux runs us with no locale
source ${0:A:h}/pill.zsh
batt=$(pmset -g batt 2>/dev/null) || exit 0
[[ $batt =~ '([0-9]+)%' ]] || exit 0
pct=$match[1]

# nf-md-battery_10 … battery_90, battery (full)
icons=($'\U000F007A' $'\U000F007B' $'\U000F007C' $'\U000F007D' $'\U000F007E'
       $'\U000F007F' $'\U000F0080' $'\U000F0081' $'\U000F0082' $'\U000F0079')
i=$(( (pct + 5) / 10 )); (( i < 1 )) && i=1; (( i > 10 )) && i=10

if [[ $batt == *"AC Power"* ]]; then solid '#98bb6c' $'\U000F0084' "${pct}%"          # charging / plugged in
elif (( pct < 20 )); then            solid '#e46876' "${icons[i]}" "${pct}%"         # low
elif (( pct < 40 )); then            solid '#e6c384' "${icons[i]}" "${pct}%"         # getting low
else                                 pill '#c8c093' "${icons[i]}" "${pct}%"
fi
