(defun bspc (command)
  "Run a command via bspc"
  (start-process-shell-command "bspc" nil (concat "bspc " command)))

(defun bspc-config (command)
  "Run a bspc config command"
  (bspc (concat "config " command)))

(defun bspc-monitor (command)
  "Run a bspc monitor command"
  (bspc (concat "monitor " command)))

(defun bspc-rule (command)
  "Run a bspc rule command"
  (bspc (concat "rule -a " command)))

(bspc-monitor "eDP-1 -r")
(bspc-monitor "HDMI-1-0 -d I II III IV V")

(bspc-config "focused_border_color '#FFCB6B'")
(bspc-config "border_width 2")
(bspc-config "window_gap 15")
(bspc-config "split_ratio 0.52")
(bspc-config "borderless_monocle true")
(bspc-config "gapless_monocle true")

(bspc-rule "Chromium desktop='^2'")
(bspc-rule "mplayer2 state=floating")
(bspc-rule "Kupfer.py focus=on")
(bspc-rule "Screenkey manage=off")
(bspc-rule "Emacs state=tiled")
