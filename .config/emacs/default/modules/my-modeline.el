(provide 'my-modeline)

(use-package hide-mode-line
  :hook
  (vterm-mode  . hide-mode-line-mode)
  (eshell-mode . hide-mode-line-mode)
  (org-mode    . hide-mode-line-mode))

(use-package doom-modeline
  :config
  (doom-modeline-mode 1))
