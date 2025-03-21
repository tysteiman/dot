(provide 'my-search)

(defun my--swiper (&optional arg)
  "Call either `swiper' or `swiper-thing-at-point' depending on if a prefix was passed.
When a prefix is passed (C-u), `swiper-thing-at-point' is used, otherwise just `swiper'."
  (interactive "P")
  (if current-prefix-arg
      (swiper-thing-at-point)
    (swiper)))

(use-package swiper
  :bind ("C-M-/" . my--swiper))
