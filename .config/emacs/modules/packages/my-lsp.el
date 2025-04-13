(provide 'my-lsp)

(use-package lsp-mode
  :init (setq lsp-headerline-breadcrumb-enable nil
              lsp-keymap-prefix "C-c l")
  :config (lsp-enable-which-key-integration)
  :bind (("C-c l s" . my/lsp-start)
         ("C-c l q" . my/lsp-stop)
         ("C-c l d" . flymake-show-buffer-diagnostics)))

(use-package lsp-java :defer t)

(defun my--buf-hook-name ()
  "Return current buffer's major mode hook as a symbol"
  (intern (format "%s-hook" major-mode)))

(defun my/lsp-start ()
  "Start LSP for the current buffer, but also attach a hook to the current
major mode to run LSP for every new buffer opened."
  (interactive)
  (lsp)
  (add-hook (my--buf-hook-name) 'lsp))

(defun my/lsp-stop ()
  "Stops LSP server and removes hooks from current major mode"
  (interactive)
  (lsp-workspace-shutdown (lsp--read-workspace))
  (remove-hook (my--buf-hook-name) 'lsp))
