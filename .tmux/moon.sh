#!/bin/zsh
# tmux status glyph: current moon phase (emoji, so the full disc is visible on any pill colour). Computed offline from the
# synodic month; prints just the glyph so it can sit inside the date pill.
export LC_ALL=en_US.UTF-8   # needed to emit UTF-8 when tmux runs us with no locale
zmodload zsh/datetime zsh/mathfunc
# new, waxing crescent, first quarter, waxing gibbous, full, waning gibbous, last quarter, waning crescent
icons=(🌑 🌒 🌓 🌔 🌕 🌖 🌗 🌘)
# reference new moon: 2000-01-06 18:14 UTC; synodic month = 2551442.8768 s
i=$(( int(fmod(EPOCHSECONDS - 947182440, 2551442.8768) / 2551442.8768 * 8 + 0.5) % 8 + 1 ))
printf '%s' "${icons[i]}"
