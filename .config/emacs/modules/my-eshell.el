(provide 'my-eshell)

(use-package eshell-toggle
  :defer t)

(use-package eshell-git-prompt
  :after eshell
  :init (setq eshell-toggle-use-projectile-root t)
  :config (eshell-git-prompt-use-theme 'multiline2))
