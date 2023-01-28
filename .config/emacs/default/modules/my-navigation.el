(provide 'my-navigation)

(use-package ibuffer
  :bind (("C-x C-b" . ibuffer)))

(use-package winner
  :config (winner-mode))

(use-package projectile
  :config
  (projectile-mode 1))

(use-package swiper :defer t)

(use-package rg
  :commands (projectile-ripgrep))

(use-package windmove
  :config (windmove-mode 1))
