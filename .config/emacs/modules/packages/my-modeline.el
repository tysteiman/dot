(provide 'my-modeline)

(use-package doom-modeline
  :init (setq doom-modeline-height 30
              doom-modeline-vcs-max-length 60
              doom-modeline-buffer-file-name-style "file-name"
              doom-modeline-time-icon nil)
  :config (doom-modeline-mode t))
