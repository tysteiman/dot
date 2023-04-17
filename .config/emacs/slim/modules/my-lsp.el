(provide 'my-lsp)

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")
  (setq lsp-headerline-breadcrumb-enable nil)
  :config (lsp-enable-which-key-integration t)
  :hook
  (typescript-mode . lsp-deferred)
  (js2-mode        . lsp-deferred)
  (php-mode        . lsp-deferred))

(use-package lsp-ui
  :init (setq lsp-ui-doc-position 'at-point)
  :hook (lsp-mode . lsp-ui-mode))
