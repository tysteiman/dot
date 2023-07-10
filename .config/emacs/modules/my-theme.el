(provide 'my-theme)

(fringe-mode 5)

(use-package yoshi-theme :defer t)
(use-package doom-themes :defer t)
(use-package gotham-theme :defer t)

(use-package hl-todo
  :hook (prog-mode . hl-todo-mode))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))
