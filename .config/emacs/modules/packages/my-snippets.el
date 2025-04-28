(provide 'my-snippets)

(use-package emmet-mode
  :defer t
  :hook
  (html-mode . (lambda () (keymap-set html-mode-map "C-j" 'emmet-expand-line)))
  (js-jsx-mode . (lambda () (keymap-set js-jsx-mode-map "C-j" 'emmet-expand-line)))
  (web-mode . (lambda () (keymap-set web-mode-map "C-j" 'emmet-expand-line))))

(use-package banner-comment
  :bind (("C-x C-;" . my--comment)))

(defun my--comment (&optional arg)
  "Call either `comment-line' or `banner-comment' based on if PREFIX was sent."
  (interactive "P")
  (if current-prefix-arg
      (banner-comment)
    (comment-line 1)))
