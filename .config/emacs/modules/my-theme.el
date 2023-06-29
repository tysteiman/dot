(provide 'my-theme)

(fringe-mode 2)

;; download some extra themes even though i don't use them on load
(use-package doom-themes :defer t)
(use-package gotham-theme :defer t)

(use-package hl-todo
  :hook (prog-mode . hl-todo-mode))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))
