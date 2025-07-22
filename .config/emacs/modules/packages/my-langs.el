(provide 'my-langs)

(use-package typescript-mode :defer t)

(use-package yaml-mode
  :defer t
  :hook (yaml-mode . (lambda ()
                       (setq show-trailing-whitespace t))))

(use-package web-mode :defer t)

(use-package dockerfile-mode :defer t)

(use-package php-mode
  :defer t
  :config (keymap-set php-mode-map "M-<tab>" 'completion-at-point))

(use-package nginx-mode :defer t)

(use-package swift-mode :defer t)

(use-package slim-mode :defer t)

(use-package csv-mode
  :hook (csv-mode . csv-align-mode))
