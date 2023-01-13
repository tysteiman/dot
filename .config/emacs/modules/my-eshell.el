(provide 'my-eshell)

(use-package eshell-toggle
  :defer t)

(use-package eshell-git-prompt
  :after eshell
  :config (eshell-git-prompt-use-theme 'multiline2))
