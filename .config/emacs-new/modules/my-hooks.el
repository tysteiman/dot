(provide 'my-hooks)

(add-hook 'compilation-filter-hook (lambda ()
                                     (ansi-color-apply-on-region (point-min) (point-max))))

(add-hook 'prog-mode-hook (lambda ()
                            (setq show-trailing-whitespace t)))

(add-hook 'org-mode-hook (lambda ()
                           (setq truncate-lines nil)))

(add-hook 'markdown-mode-hook (lambda ()
                                (setq truncate-lines nil)))
