(provide 'my-modeline)

(use-package doom-modeline
  :init (setq doom-modeline-height 45
              doom-modeline-icon nil
              doom-modeline-buffer-file-name-style 'file-name
              doom-modeline-vcs-max-length 30)
  :config (doom-modeline-mode t))
