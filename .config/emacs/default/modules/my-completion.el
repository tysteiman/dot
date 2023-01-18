(provide 'my-completion)

(use-package emmet-mode
  :defer t)

(use-package smartparens
  :hook (prog-mode . smartparens-mode))

(use-package counsel)
