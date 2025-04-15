(provide 'my-git)

(use-package magit
  :bind (("C-c m" . magit-status)))

(use-package diff-hl
  :hook
  (prog-mode . diff-hl-mode)
  (yaml-mode . diff-hl-mode)
  (nxml-mode . diff-hl-mode)
  (conf-mode . diff-hl-mode)
  (magit-pre-refresh . diff-hl-magit-pre-refresh)
  (magit-post-refresh . diff-hl-magit-post-refresh))
