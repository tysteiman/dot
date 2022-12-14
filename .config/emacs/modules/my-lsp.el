(provide 'my-lsp)

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")
  (setq lsp-headerline-breadcrumb-enable nil)
  :config
  (lsp-enable-which-key-integration t)
  :hook
  (c-mode    . lsp-deferred)
  (js2-mode  . lsp-deferred)
  (rust-mode . lsp-deferred)
  (php-mode  . lsp-deferred))

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode))

(use-package lsp-treemacs
  :after lsp)
