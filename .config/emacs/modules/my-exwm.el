(provide 'my-exwm)

(use-package exwm
  :config
  (setq exwm-workspace-number 5)
  (setq exwm-input-prefix-keys
        '(?\C-x
          ?\C-u
          ?\C-h
          ?\M-x
          ;; ?\M-`
          ?\M-&
          ?\M-:
          ;; ?\C-\M-j
          ;; ?\C-\ 
          ))
  (define-key exwm-mode-map [?\C-q] 'exwm-input-send-next-key)
  (setq exwm-input-global-keys `(
                                 ([?\s-d] . (lambda (command)
                                              (interactive (list (read-shell-command "$ ")))
                                              (start-process-shell-command command nil command)))
                                 ([?\s-w] . exwm-workspace-switch)
                                 ([s-left] . windmove-left)
                                 ([s-right] . windmove-right)
                                 ([s-up] . windmove-up)
                                 ([s-down] . windmove-down)
                                 ([?\s-h] . windmove-left)
                                 ([?\s-l] . windmove-right)
                                 ([?\s-k] . windmove-up)
                                 ([?\s-j] . windmove-down)
                                 ([?\s-=] . balance-windows)
                                 ([?\s-r] . rename-buffer)
                                 ([?\s-f] . exwm-layout-toggle-fullscreen)
                                 ([?\s-e] . eshell)
                                 ([s-return] . vterm)
                                 ,@(mapcar (lambda (i)
                                             `(,(kbd (format "s-%d" i)) .
                                               (lambda ()
                                                 (interactive)
                                                 (exwm-workspace-switch-create ,i))))
                                           (number-sequence 0 9))
                                 ))
  (add-hook 'exwm-update-class-hook (lambda ()
                                      (exwm-workspace-rename-buffer (format "*%s*" exwm-class-name))))
  (require 'exwm-randr)
  (exwm-randr-enable)
  (start-process-shell-command "xrandr" nil "xrandr --output eDP-1 --mode 1920x1080 --brightness 0 --output HDMI-1-0 --mode 2560x1440 --primary --right-of eDP-1")
  (start-process-shell-command "feh" nil "feh --bg-scale ~/dot/wallpaper/bright-mountains.jpg")
  (start-process-shell-command "picom" nil "picom -b")
  (exwm-enable))
