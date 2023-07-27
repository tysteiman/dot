(provide 'my-modeline)

(use-package doom-modeline
  :init (setq doom-modeline-height 40
              doom-modeline-icon nil
              doom-modeline-buffer-file-name-style 'file-name
              doom-modeline-vcs-max-length 30
              doom-modeline-env-enable-ruby nil)
  :config (doom-modeline-mode t))
