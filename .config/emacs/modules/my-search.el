(provide 'my-search)

(use-package swiper
  :bind (("C-M-s" . swiper-thing-at-point)))

(use-package rg
  :commands (projectile-ripgrep))
