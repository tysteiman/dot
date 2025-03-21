(provide 'my-search)

(defun my--swiper (&optional arg)
  (interactive "P")
  (if current-prefix-arg
      (swiper-thing-at-point)
    (swiper)))

(use-package swiper
  :bind ("C-M-/" . my--swiper))
