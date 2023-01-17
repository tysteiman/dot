(provide 'my-modeline)

(use-package doom-modeline
  :init
  (setq doom-modeline-height 40
        doom-modeline-bar-width 3
        doom-modeline-vcs-max-length 25
        doom-modeline-buffer-file-name-style "file-name")
  :config
  (doom-modeline-mode 1)
  ;; (set-face-attribute 'doom-modeline-time nil :foreground "#e0af68")
  ;; (set-face-attribute 'doom-modeline-evil-normal-state nil :background "#7aa2f7" :foreground "black")
  ;; (set-face-attribute 'doom-modeline-evil-insert-state nil :background "#73daca" :foreground "black")
  ;; (set-face-attribute 'doom-modeline-evil-visual-state nil :background "#e0af68" :foreground "black")
  ;; (set-face-attribute 'doom-modeline-evil-emacs-state nil :background "#bb9af7" :foreground "black")
  )

(use-package hide-mode-line
  :hook
  (vterm-mode . hide-mode-line-mode)
  (eshell-mode . hide-mode-line-mode))

;; (defun my/format-mode-line (left right)
;;   (let* ((available-width (- (window-width) (length left) 2)))
;;     (format (format " %%s %%%ds " available-width) left right)))
;; 
;; (setq-default mode-line-format
;;               '((:eval (my/format-mode-line
;;                         (format-mode-line "%b")
;;                         (format-mode-line (car (split-string display-time-string)))))))
