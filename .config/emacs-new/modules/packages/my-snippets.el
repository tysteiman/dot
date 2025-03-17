(provide 'my-snippets)

(use-package emmet-mode
  :defer t
  :hook
  (html-mode . (lambda () (keymap-set html-mode-map "C-j" 'emmet-expand-line)))
  (js-jsx-mode . (lambda () (keymap-set js-jsx-mode-map "C-j" 'emmet-expand-line))))
