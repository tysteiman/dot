#!/bin/zsh
# tmux status pill: red ghost icon while Slack's dock badge shows anything (a count for
# DMs/mentions, "•" for unread channels); nothing otherwise (clear, or Slack not running).
# The badge is read with lsappinfo, so no API token is needed.
export LC_ALL=en_US.UTF-8

# running: "StatusLabel"={ "label"="3" }   (or "label"="" when clear); not running: no output
info=$(lsappinfo info -only StatusLabel Slack 2>/dev/null)
[[ $info =~ '"label"="([^"]+)"' ]] || exit 0

# Icon-only variant of pill() from pill.zsh: caps hug the glyph, no text slot. It's the last
# item in status-right (after the clock), so the gap goes before the pill instead of after.
red='#e46876' bar='#16161d'   # waveRed on sumiInk0
print -rn -- " #[fg=$red,bg=$bar]"$''"#[fg=$bar,bg=$red]"$'\U000F02A0'"#[fg=$red,bg=$bar]"$''   # nf-md-ghost
