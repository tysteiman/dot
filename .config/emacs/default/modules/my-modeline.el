(provide 'my-modeline)

(defun my/modeline--readonly ()
  "Modeline configuration if the file is read only"
  (if buffer-read-only
      (propertize "  " 'face '(:foreground "OrangeRed" :height 150))
    ""))

(defun my/modeline--vim ()
  "Modeline configuration for vim (evil) state"
  (require 'evil)
  (propertize "" 'face `(
                          :foreground ,(cond ((string= "insert" evil-state) "MediumSpringGreen")
                                             ((string= "visual" evil-state) "DodgerBlue")
                                             ((string= "emacs" evil-state) "MediumPurple")
                                             (t "LightYellow"))
                          :height 150)))

(defun my/modeline--file ()
  "Modeline counfiguration for displaying current file information"
  (propertize "%b" 'face '(:foreground "indianred")))

(defun my/modeline--git ()
  "Modeline configuration for displaying git information"
  (require 'vc-git)
  (require 'projectile)
  (let ((branch (car (vc-git-branches))))
    (when branch
      (propertize
       (format
        "  [%s:%s]"
        (projectile-project-name)
        branch)
       'face '(:foreground "MediumPurple")))))

(defun my/modeline--time ()
  "Modeline configuration for displaying the time"
  (require 'vc-git)
  (propertize
   (car (split-string display-time-string))
   'face '(:foreground "CadetBlue")))

(defun my/modeline--format ()
  "Modeline format using `format-mode-line', regardless of what is consuming it i.e. mini-modeline
or default `mode-line-format'."
  '(:eval (format-mode-line `(,(my/modeline--readonly)
                              "  "
                              ,(my/modeline--vim)
                              "  "
                              ,(my/modeline--file)
                              ,(my/modeline--git)
                              "  "
                              ,(my/modeline--time)))))

(setq-default mode-line-format (my/modeline--format))
