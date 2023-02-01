(provide 'my-modeline)

(defvar my/modeline--spaces "  "
  "Spaces to inject between modeline items")

(defun my/modeline--readonly ()
  "Modeline configuration if the file is read only"
  (if buffer-read-only
      (propertize (concat my/modeline--spaces "") 'face '(:foreground "OrangeRed" :height 150))
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
  "Modeline counfiguration for displaying current file information.

This will set the file color based on file save state, etc."
  (propertize "%b" 'face `(:foreground ,(if (and (buffer-modified-p)
                                                 (buffer-file-name))
                                            "indianred"
                                          "LightYellow"))))

(defun my/modeline--git ()
  "Modeline configuration for displaying git information"
  (require 'vc-git)
  (require 'projectile)
  (let ((branch (car (vc-git-branches))))
    (when branch
      (propertize
       (concat my/modeline--spaces (format "[%s:%s]" (projectile-project-name) branch))
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
                              my/modeline--spaces
                              ,(my/modeline--vim)
                              my/modeline--spaces
                              ,(my/modeline--file)
                              ,(my/modeline--git)
                              my/modeline--spaces
                              ,(my/modeline--time)))))

(setq-default mode-line-format (my/modeline--format))

(use-package hide-mode-line
  :hook
  (vterm-mode  . hide-mode-line-mode)
  (eshell-mode . hide-mode-line-mode)
  (org-mode    . hide-mode-line-mode))

(use-package doom-modeline
  :config
  (doom-modeline-mode 1)
  (let ((fmt mode-line-format))
    (setq-default header-line-format fmt)
    (setq-default mode-line-format nil)))
