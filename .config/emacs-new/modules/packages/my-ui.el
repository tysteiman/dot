(provide 'my-ui)

(use-package ef-themes :defer t)

(use-package doom-themes :defer t)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package diredfl
  :hook (dired-mode . diredfl-mode))

(use-package doom-modeline
  :init (setq doom-modeline-height 30
              doom-modeline-vcs-max-length 60
              doom-modeline-buffer-file-name-style "file-name"
              doom-modeline-time-icon nil)
  :config (doom-modeline-mode t))
