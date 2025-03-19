(provide 'my-git)

(use-package magit :defer t)

(use-package diff-hl
  :hook
  (prog-mode . diff-hl-mode)
  (yaml-mode . diff-hl-mode)
  (nxml-mode . diff-hl-mode)
  (magit-pre-refresh . diff-hl-magit-pre-refresh)
  (magit-post-refresh . diff-hl-magit-post-refresh))
