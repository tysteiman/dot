(provide 'my-langs)

(use-package dockerfile-mode
  :defer t)

(use-package yaml-mode
  :hook (yaml-mode . my/configure-prog-mode))

(use-package conf-mode
  :hook (conf-mode . my/configure-prog-mode)
  :mode "\\.env\\'")

(use-package js2-mode
  :defer t
  :mode "\\.js\\'")

(use-package rjsx-mode
  :defer t
  :init
  (setq js2-mode-show-parse-errors nil)
  (setq js2-mode-show-strict-warnings nil)
  :mode "\\.jsx\\'"
  :config
  (define-key rjsx-mode-map (kbd "C-j") 'emmet-expand-line)
  (define-key rjsx-mode-map (kbd "M-.") 'xref-find-definitions)
  (define-key js2-mode-map (kbd "M-.") 'xref-find-definitions))

(use-package typescript-mode
  :defer t)

(use-package php-mode
  :defer t)

(use-package web-mode
  :mode "\\.erb\\'"
  :mode "\\.php\\'"
  :mode "\\.html\\'"
  :mode "\\.ctp\\'"
  :config
  (define-key web-mode-map (kbd "C-j") 'emmet-expand-line))

(use-package markdown-mode
  :defer t
  :hook (markdown-mode . my/configure-prog-mode))

(use-package slim-mode
  :defer t)

(use-package csv-mode
  :defer t
  :hook (csv-mode . csv-align-mode))

(use-package json-mode
  :defer t)

(use-package fish-mode
  :defer t)

(use-package rust-mode
  :defer t)

(use-package lua-mode
  :defer t)
