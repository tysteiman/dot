(provide 'my-git)

(use-package magit
  :bind (("C-c m" . magit-status))
  :config
  (add-to-list 'display-buffer-alist
               '("magit:.*"
                 (display-buffer-in-side-window)
                 (side . left)
                 (slot . 1)
                 (window-width . 0.33)))
  (add-to-list 'display-buffer-alist
               '("magit-log:.*"
                 (display-buffer-in-side-window)
                 (side . left)
                 (slot . 0)
                 (window-width . 0.33))))

(use-package diff-hl
  :hook
  (prog-mode . diff-hl-mode)
  (yaml-mode . diff-hl-mode)
  (nxml-mode . diff-hl-mode)
  (conf-mode . diff-hl-mode)
  (magit-pre-refresh . diff-hl-magit-pre-refresh)
  (magit-post-refresh . diff-hl-magit-post-refresh))
