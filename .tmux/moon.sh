#!/bin/zsh
# tmux status glyph: current moon phase (emoji, so the full disc is visible on any pill colour). Computed offline from the
# synodic month; prints just the glyph so it can sit inside the date pill.
export LC_ALL=en_US.UTF-8   # needed to emit UTF-8 when tmux runs us with no locale
zmodload zsh/datetime zsh/mathfunc
# new, waxing crescent, first quarter, waxing gibbous, full, waning gibbous, last quarter, waning crescent
icons=(🌑 🌒 🌓 🌔 🌕 🌖 🌗 🌘)
# reference new moon: 2000-01-06 18:14 UTC; synodic month = 2551442.8768 s
# Equal 1/8 bins make "quarter" cover ~5 days, so a 38%-lit moon shows as half. Instead the four principal phases only
# get a narrow window (+-0.03 cycle, ~0.9 day) around the exact moment; crescents/gibbous take the wider gaps between.
f=$(( fmod(EPOCHSECONDS - ${MOON_NOW_OFFSET:-0} - 947182440, 2551442.8768) / 2551442.8768 ))
w=0.03
if   (( f < w || f >= 1 - w ));   then i=1   # new
elif (( f < 0.25 - w ));          then i=2   # waxing crescent
elif (( f < 0.25 + w ));          then i=3   # first quarter
elif (( f < 0.5 - w ));           then i=4   # waxing gibbous
elif (( f < 0.5 + w ));           then i=5   # full
elif (( f < 0.75 - w ));          then i=6   # waning gibbous
elif (( f < 0.75 + w ));          then i=7   # last quarter
else                                   i=8   # waning crescent
fi
printf '%s' "${icons[i]}"
