(provide 'my-treemacs)

(use-package treemacs-all-the-icons
  :after treemacs)

(use-package treemacs
  :defer t
  :config
  (treemacs-load-theme "all-the-icons")
  (treemacs-project-follow-mode)
  (treemacs t))
