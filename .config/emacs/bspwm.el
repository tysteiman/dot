(defun bspc (cmd-group command)
  "Run command(s) via bspc.

CMD-GROUP is the group that bspc will use e.g. config, monitor, rule.

COMMAND is either a string of a command to run, or a list of strings."
  (let ((command-set (if (listp command)
                         command
                       (list command))))
    (dolist (cmd command-set)
      (start-process-shell-command "bspc" nil (concat "bspc " cmd-group " " cmd)))))

(defun bspc-config (command)
  "Run a bspc config command"
  (bspc "config" command))

(defun bspc-monitor (command)
  "Run a bspc monitor command"
  (bspc "monitor" command))

(defun bspc-rule (command)
  "Run a bspc rule command"
  (bspc "rule -a" command))

;; fire bspwm configs
(bspc-monitor '("eDP-1 -r"
                "HDMI-1-0 -d I II III IV V"))

(bspc-config '("focused_border_color '#c792ea'"
               "presel_feedback_color '#3C435E'"
               "border_width 1"
               "window_gap 5"
               "split_ratio 0.60"
               "borderless_monocle true"
               "gapless_monocle true"
               "focus_follows_pointer true"))

(bspc-rule '("Chromium desktop='^2'"
             "mplayer2 state=floating"
             "Kupfer.py focus=on"
             "Screenkey manage=off"
             "Emacs state=tiled"))
