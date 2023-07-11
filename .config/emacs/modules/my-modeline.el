(provide 'my-modeline)

(use-package doom-modeline
  :init (setq doom-modeline-height 45
              doom-modeline-icon nil
              doom-modeline-buffer-file-name-style 'file-name)
  :config (doom-modeline-mode t))
