(provide 'my-theme)

(fringe-mode 2)

(use-package doom-themes :defer t)

(use-package hl-todo
  :hook (prog-mode . hl-todo-mode))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))
