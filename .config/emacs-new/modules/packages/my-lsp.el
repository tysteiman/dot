(provide 'my-lsp)

(use-package lsp-mode
  :defer t
  :init (setq lsp-headerline-breadcrumb-enable nil))

(use-package lsp-java
  :hook (java-mode . lsp))
