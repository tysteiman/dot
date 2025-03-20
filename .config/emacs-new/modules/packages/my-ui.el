(provide 'my-ui)

(defun my--load-dark-random ()
  "Load a random dark theme"
  (interactive)
  (ef-themes-load-random 'dark))

(defun my--load-light-random ()
  "Load a random light theme"
  (interactive)
  (ef-themes-load-random 'light))

(use-package ef-themes
  :bind
  (("C-c u d" . my--load-dark-random)
   ("C-c u l" . my--load-light-random)))

(use-package doom-themes :defer t)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package diredfl
  :hook (dired-mode . diredfl-mode))

;; (use-package doom-modeline
;;   :init (setq doom-modeline-height 30
;;               doom-modeline-vcs-max-length 60
;;               doom-modeline-buffer-file-name-style "file-name"
;;               doom-modeline-time-icon nil)
;;   :config (doom-modeline-mode t))
