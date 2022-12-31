(provide 'my-ui)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package rainbow-mode
  :defer t)

(use-package hl-todo
  :hook (prog-mode . hl-todo-mode))

(use-package doom-modeline
  :init
  (setq doom-modeline-height 50)
  (setq doom-modeline-bar-width 5)
  (setq doom-modeline-vcs-max-length 25)
  (setq doom-modeline-buffer-file-name-style "file-name")
  :config (doom-modeline-mode 1))

(use-package solaire-mode
  :init (solaire-global-mode +1))

(use-package dimmer
  :config (setq dimmer-fraction 0.4)
  :init (dimmer-mode t))

(use-package diredfl
  :hook (dired-mode . diredfl-mode))

