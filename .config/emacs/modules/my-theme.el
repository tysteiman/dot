(provide 'my-theme)

(fringe-mode 2)

(set-cursor-color "red")
(set-background-color "black")
(set-foreground-color "darkgrey")

(use-package doom-themes :defer t)
(use-package gotham-theme :defer t)

(use-package hl-todo
  :hook (prog-mode . hl-todo-mode))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))
