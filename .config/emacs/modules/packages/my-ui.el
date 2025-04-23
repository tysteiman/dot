(provide 'my-ui)

(defun my/load-dark-random ()
  "Load a random dark theme"
  (interactive)
  (ef-themes-load-random 'dark))

(defun my/load-light-random ()
  "Load a random light theme"
  (interactive)
  (ef-themes-load-random 'light))

(use-package ef-themes
  :demand t
  :config (load-theme 'ef-dark t)
  :bind (("C-c u d" . my/load-dark-random)
         ("C-c u l" . my/load-light-random)))

(use-package doom-themes :defer t)

(use-package zenburn-theme :defer t)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package diredfl
  :hook (dired-mode . diredfl-mode))

(use-package rainbow-mode
  :bind (("C-c u r" . rainbow-mode)))

(use-package focus
  :bind (("C-c u f" . focus-mode)))

(use-package hl-todo
  :hook (prog-mode . hl-todo-mode))
