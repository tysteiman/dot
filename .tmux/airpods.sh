#!/bin/zsh
# tmux status pill: bluetooth icon + AirPods battery (the lower bud) while they're connected;
# nothing otherwise. Red below 20%, yellow below 40%, soft grey with a blue icon otherwise.
# Device name can be overridden with $AIRPODS_NAME (straight or curly apostrophe both match).
export LC_ALL=en_US.UTF-8
source ${0:A:h}/pill.zsh
name=${AIRPODS_NAME:-"Tyler's AirPods"}

# system_profiler lists devices under "Connected:" / "Not Connected:"; take the battery
# lines (Left/Right for buds, Main for AirPods Max) of our device in the Connected block.
# (macOS names it with a curly ’; BSD awk can't match that byte sequence, so sed folds it first.)
name=${name//’/\'}
raw=$(system_profiler SPBluetoothDataType 2>/dev/null | sed "s/’/'/g" | awk -v want="$name" '
  function norm(s) { sub(/^ +/, "", s); sub(/:$/, "", s); return s }
  /^ *Connected:$/     { conn = 1; next }
  /^ *Not Connected:$/ { conn = 0; next }
  conn && /:$/ { dev = (norm($0) == norm(want)); next }   # device header (attrs have values)
  conn && dev && /(Left|Right|Main) Battery Level: [0-9]+%/ { lvl[$1] = $NF + 0 }
  END { if ("Left" in lvl) printf "%d ", lvl["Left"]
        if ("Right" in lvl) printf "%d ", lvl["Right"]
        if ("Main" in lvl) printf "%d ", lvl["Main"] }')
levels=(${=raw})            # left right (or just one bud / Max), in that order
(( ${#levels} )) || exit 0
text=${(j: :)levels/%/%}    # "76% 98%"
low=${${(on)levels}[1]}      # colour by whichever bud is lower

bt=$'\U000F00AF'   # nf-md-bluetooth
if   (( low < 20 )); then solid '#e46876' $bt "$text"
elif (( low < 40 )); then solid '#e6c384' $bt "$text"
else                      pill  '#7e9cd8' $bt "$text"
fi
