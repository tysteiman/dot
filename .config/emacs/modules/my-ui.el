(provide 'my-ui)

(add-to-list 'default-frame-alist '(font . "JetBrainsMono Nerd Font-11"))
(set-frame-parameter (selected-frame) 'alpha '(90 90))
(add-to-list 'default-frame-alist '(alpha 90 90))

(use-package rainbow-delimiters
  :defer t
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package rainbow-mode
  :defer t)

(use-package hl-todo
  :hook (prog-mode . hl-todo-mode))

(use-package all-the-icons
  :defer t)

(use-package solaire-mode
  :defer 1
  :init (solaire-global-mode +1))
