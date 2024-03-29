(provide 'my-theme)

(fringe-mode 5)

(use-package doom-themes
  :config (load-theme 'doom-feather-dark t))

(use-package catppuccin-theme :defer t)

(use-package hl-todo
  :hook (prog-mode . hl-todo-mode))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package diredfl
  :hook (dired-mode . diredfl-mode))
