(provide 'my-hooks)

(add-hook 'prog-mode-hook (lambda ()
                            (setq show-trailing-whitespace t)
                            (hl-line-mode)))

(add-hook 'org-mode-hook (lambda ()
                           (org-indent-mode)
                           (setq truncate-lines nil)))

(add-hook 'compilation-filter-hook (lambda ()
                                     (ansi-color-apply-on-region (point-min) (point-max))))
