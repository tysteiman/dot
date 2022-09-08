(defun bspc (cmd-group command)
  "Run command(s) via bspc.

CMD-GROUP is the group that bspc will use e.g. config, monitor, rule.

COMMAND is either a string of a command to run, or a list of strings."
  (let ((command-set (if (listp command)
                         command
                       (list command))))
    (dolist (cmd command-set)
      (let ((setting (symbol-name (car cmd)))
            (value (format "%s" (cdr cmd))))
        (shell-command (concat "bspc " cmd-group " " setting " " value))))))

(defun bspc-config (command)
  "Run a bspc config command"
  (bspc "config" command))

(defun bspc-monitor (command)
  "Run a bspc monitor command"
  (bspc "monitor" command))

(defun bspc-rule (command)
  "Run a bspc rule command"
  (bspc "rule -a" command))

(bspc-monitor '((eDP-1    . "-r")
                (HDMI-1-0 . "-d 1 2 3 4 5")))

(bspc-config '((focused_border_color  . "'#c792ea'")
               (presel_feedback_color . "'#717CB4'")
               (border_width          . 2)
               (window_gap            . 0)
               (split_ratio           . 0.60)
               (focus_follows_pointer . false)))

(bspc-rule '((Emacs . state=tiled)))
