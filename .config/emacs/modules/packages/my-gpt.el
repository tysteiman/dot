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
  (gptel-make-gemini "Gemini"
    :key 'my--gptel-gemini-key
    :stream t
    :models '(gemini-2.0-flash))
  (setq gptel-backend (gptel-make-anthropic "Claude"
                        :stream t
                        :key 'my--gptel-anthropic-key
                        :models '(claude-sonnet-4-20250514)))
  (setq gptel-model 'claude-sonnet-4-20250514)
  (add-to-list 'display-buffer-alist
               '("*Claude*"
                 (display-buffer-in-side-window)
                 (side . right)
                 (slot . 1)
                 (window-width . 0.33)))
  (add-to-list 'display-buffer-alist
               '("*ChatGPT*"
                 (display-buffer-in-side-window)
                 (side . right)
                 (slot . 1)
                 (window-width . 0.33))))
