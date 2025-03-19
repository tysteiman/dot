(provide 'my-gpt)

(use-package gptel
  :defer t
  :init (let ((keyfile "~/.gpt.el"))
          (setq gptel-default-mode 'org-mode)
          (when (file-exists-p keyfile)
            (load-file keyfile)
            (setq gptel-api-key 'my--gptel-key)))
  :bind (("C-c a a" . 'gptel)
         ("C-c a s" . 'gptel-send)
         ("C-c a c" . 'gptel-add)
         ("C-c a f" . 'gptel-add-file)
         ("C-c a q" . 'gptel-context-remove-all)
         ("C-c a r" . 'gptel-rewrite)
         ("C-c a m" . 'gptel-menu))
  :config
  (gptel-make-anthropic "Claude"
    :stream t
    :key 'my--gptel-anthropic-key
    :models '(claude-3-7-sonnet-20250219)))
