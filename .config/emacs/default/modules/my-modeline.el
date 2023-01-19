(provide 'my-modeline)

;; (use-package doom-modeline
;;   :init
;;   (setq doom-modeline-height 45
;;         doom-modeline-bar-width 3
;;         doom-modeline-vcs-max-length 25
;;         doom-modeline-buffer-file-name-style "file-name")
;;   :config
;;   (doom-modeline-mode 1)
;;   ;; (set-face-attribute 'doom-modeline-time nil :foreground "#e0af68")
;;   ;; (set-face-attribute 'doom-modeline-evil-normal-state nil :background "#7aa2f7" :foreground "black")
;;   ;; (set-face-attribute 'doom-modeline-evil-insert-state nil :background "#73daca" :foreground "black")
;;   ;; (set-face-attribute 'doom-modeline-evil-visual-state nil :background "#e0af68" :foreground "black")
;;   ;; (set-face-attribute 'doom-modeline-evil-emacs-state nil :background "#bb9af7" :foreground "black")
;;   )

;; (use-package hide-mode-line
;;   :hook
;;   (vterm-mode  . hide-mode-line-mode)
;;   (eshell-mode . hide-mode-line-mode)
;;   (org-mode    . hide-mode-line-mode))
;; 
;; (defun my/format-mode-line (left right)
;;   (let* ((available-width (- (window-width) (length left) 2)))
;;     (format (format " %%s %%%ds " available-width) left right)))

;; (setq-default mode-line-format
;;               '((:eval (my/format-mode-line
;;                         (format-mode-line "%b")
;;                         (format-mode-line (car (split-string display-time-string)))))))

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

;; (use-package mini-modeline
;;   :init
;;   (setq mini-modeline-r-format (my/modeline--format))
;;   :config
;;   (mini-modeline-mode))
