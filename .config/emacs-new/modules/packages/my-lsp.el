(provide 'my-lsp)

(use-package lsp-mode
  :defer t
  :init (setq lsp-headerline-breadcrumb-enable nil
              lsp-keymap-prefix "C-c l")
  :config (lsp-enable-which-key-integration)
  :bind (("C-c l s" . my/lsp-start)
         ("C-c l q" . my/lsp-stop)
         ("C-c l d" . flymake-show-buffer-diagnostics)))

(use-package lsp-java :defer t)

(defun my/lsp-start ()
  "Launch LSP and add hook for prog-mode"
  (interactive)
  (lsp)
  (add-hook 'prog-mode-hook 'lsp))

(defun my/lsp-stop ()
  "Stops LSP server and removes hook for prog-mode"
  (interactive)
  (remove-hook 'prog-mode-hook 'lsp)
  (lsp-workspace-shutdown (lsp--read-workspace)))
