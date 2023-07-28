(provide 'my-search)

(use-package swiper
  :bind (("C-M-/" . swiper-thing-at-point)))

(use-package rg
  :commands (projectile-ripgrep))
