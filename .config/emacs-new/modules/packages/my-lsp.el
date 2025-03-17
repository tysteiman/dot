(provide 'my-lsp)

(use-package lsp-mode
  :defer t
  :init (setq lsp-headerline-breadcrumb-enable nil))

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
  (remove-hook (my--buf-hook-name) 'lsp)
  (lsp-workspace-shutdown (lsp--read-workspace)))
