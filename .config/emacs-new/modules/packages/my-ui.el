(provide 'my-ui)

(use-package ef-themes
  :config (load-theme 'ef-autumn t))

(use-package doom-themes :defer t)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package diredfl
  :hook (dired-mode . diredfl-mode))
