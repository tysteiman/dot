(provide 'my-theme)

(use-package adwaita-dark-theme
  :config
  (load-theme 'adwaita-dark t)
  (eval-after-load 'diff-hl #'adwaita-dark-theme-diff-hl-fringe-bmp-enable))
