#!/bin/zsh
# tmux status pill: crossed swords + count of unread Wowhead WoW: Forever news articles. Hidden when there are none.
#   wowhead.sh          print the pill (cheap: reads the cache, never blocks on the network)
#   wowhead.sh pick     fzf browser, run in a popup by prefix u:
#                         enter   open in browser + mark read     ctrl-x  toggle read/unread
#                         ctrl-d  mark ALL read and close         ctrl-r  refetch the feed now
#   (internal, used by pick: list · preview ID · toggle ID · open ID · all · fetch)
# The RSS feed is refreshed in the background at most every TTL seconds. Read state is a set of article ids, so
# individual articles can be marked either way. First run marks everything currently published as read, so you
# don't start with 40 unread. State lives in ~/.cache/wowhead/.
export LC_ALL=en_US.UTF-8   # needed to emit the Nerd Font glyphs when tmux runs us with no locale
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"
self=${0:A}
source ${self:h}/pill.zsh
zmodload zsh/datetime zsh/stat

dir=${XDG_CACHE_HOME:-$HOME/.cache}/wowhead
feed=${WOWHEAD_FEED:-https://www.wowhead.com/news/rss/forever}
ttl=${WOWHEAD_TTL:-900}
cache=$dir/articles.tsv   # "id<TAB>date<TAB>title<TAB>description", newest first
readf=$dir/read           # one read article id per line
oldseen=$dir/last_seen_id # previous "everything up to this id" state; migrated into $readf
stamp=$dir/last_fetch
lock=$dir/lock
mkdir -p $dir

# RSS -> cache lines. Plain-UA curl works; the HTML page 403s without one.
parse='
  sub dec { my $s = shift;
    $s =~ s/<!\[CDATA\[(.*?)\]\]>/$1/s;
    $s =~ s/&lt;/</g; $s =~ s/&gt;/>/g; $s =~ s/&quot;/"/g;
    $s =~ s/&#x([0-9a-f]+);/chr(hex($1))/gie; $s =~ s/&#(\d+);/chr($1)/ge; $s =~ s/&amp;/&/g;
    return $s }
  while (m{<item><title>(.*?)</title><link>[^<]*?news=(\d+)[^<]*</link><description>(.*?)</description>.*?<pubDate>(.*?)</pubDate>}sg) {
    ($t, $i, $d, $p) = (dec($1), $2, dec($3), $4);
    $d =~ s{<br\s*/?>}{ }gi; $d =~ s/<[^>]*>//g; $d =~ s/Continue reading\s*\x{BB}//;   # tags, trailing "Continue reading »"
    for ($t, $d) { s/&amp;/&/g; s/\s+/ /g; s/^ | $//g }
    ($dt) = $p =~ /, (\d+ \w+)/; $dt =~ s/(\d+) (\w+)/$2 $1/;
    print "$i\t$dt\t$t\t$d\n";
  }'

refresh() {
  mkdir $lock 2>/dev/null || return          # another refresh is running
  trap 'rmdir $lock' EXIT
  : >| $stamp                                # stamp first so a failing network isn't retried every 5s
  local tmp=$dir/feed.$$
  curl -fsS -m 15 -A 'Mozilla/5.0' -o $tmp.xml $feed 2>/dev/null \
    && perl -CSDA -0777 -ne $parse $tmp.xml >| $tmp.tsv 2>/dev/null \
    && [[ -s $tmp.tsv ]] && mv $tmp.tsv $cache
  rm -f $tmp.xml $tmp.tsv
}

stale() {
  [[ -f $stamp ]] || return 0
  local -a m; zstat -A m +mtime $stamp
  (( EPOCHSECONDS - m[1] > ttl ))
}

# a lock left behind by a killed refresh would block fetching forever; drop it after 2 minutes
if [[ -d $lock ]]; then
  local -a lm; zstat -A lm +mtime $lock
  (( EPOCHSECONDS - lm[1] > 120 )) && rmdir $lock
fi

ids=(); typeset -A R
load() {
  ids=(); [[ -s $cache ]] && ids=(${(f)"$(cut -f1 $cache)"})
  # first run: baseline = everything published so far is read. Upgrade from the old single last_seen_id likewise.
  if [[ ! -f $readf ]] && (( ${#ids} )); then
    local floor=0; [[ -f $oldseen ]] && floor=$(<$oldseen)
    for i in $ids; do (( i <= floor )) || [[ ! -f $oldseen ]] && print -r -- $i; done >| $readf
    rm -f $oldseen
  fi
  R=(); local i; [[ -f $readf ]] && for i in ${(f)"$(<$readf)"}; do R[$i]=1; done
}

flash() { tmux refresh-client -S 2>/dev/null }   # redraw the status bar now rather than at the next 5s tick

case $1 in
  list)       # id<TAB>display, unread in green-dotted bold, read dimmed
    load
    for line in ${(f)"$(<$cache)"}; do
      f=("${(@ps:\t:)line}")
      if [[ -n $R[$f[1]] ]]; then print -r -- "$f[1]"$'\t\e[90m  '"$f[2]  $f[3]"$'\e[0m'
      else                        print -r -- "$f[1]"$'\t\e[32m●\e[0m '$'\e[33m'"$f[2]"$'\e[0m  \e[1m'"$f[3]"$'\e[0m'
      fi
    done ;;
  preview)
    for line in ${(f)"$(grep -m1 "^$2"$'\t' $cache)"}; do
      f=("${(@ps:\t:)line}")
      print -r -- $'\e[1m'"$f[3]"$'\e[0m'; print -r -- $'\e[33m'"$f[2]"$'\e[0m  \e[90mhttps://www.wowhead.com/news='"$f[1]"$'\e[0m\n'
      print -r -- "$f[4]" | fold -s -w ${FZF_PREVIEW_COLUMNS:-60}
    done ;;
  toggle)
    load
    if [[ -n $R[$2] ]]; then grep -vx -- $2 $readf >| $readf.tmp; mv $readf.tmp $readf   # grep -v exits 1 on empty output; fine
    else print -r -- $2 >> $readf; fi
    flash ;;
  open)
    load; [[ -n $R[$2] ]] || print -r -- $2 >> $readf
    open "https://www.wowhead.com/news=$2"; flash ;;
  all)
    load; print -l -- $ids >| $readf; flash ;;       # also prunes ids that have scrolled out of the feed
  fetch)
    rm -f $stamp; refresh ;;
  pick)
    [[ -s $cache ]] || refresh                      # very first run: nothing cached yet
    load
    ( (( ${#ids} )) ) || { print "no articles cached (feed unreachable?)"; read -k1; exit 1 }
    $self list | fzf --border=rounded --reverse --ansi --delimiter=$'\t' --with-nth=2.. --no-sort \
      --track --id-nth=1 --prompt='wow> ' \
      --header=$'enter: open + read · ctrl-x: toggle read · ctrl-d: all read · ctrl-r: refetch' \
      --preview="$self preview {1}" --preview-window=right:50%:wrap:border-left \
      --bind "enter:execute-silent($self open {1})+abort" \
      --bind "ctrl-x:execute-silent($self toggle {1})+reload($self list)" \
      --bind "ctrl-d:execute-silent($self all)+abort" \
      --bind "ctrl-r:execute-silent($self fetch)+reload($self list)"
    flash ;;
  *)
    stale && { refresh >/dev/null 2>&1 </dev/null &! }
    load
    count=0; for id in $ids; do [[ -n $R[$id] ]] || (( count++ )); done
    (( count )) && solid '#e6c384' $'\U000F0787' "$count"   # md-sword_cross; carpYellow ≈ gold
    exit 0 ;;
esac
