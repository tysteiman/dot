(provide 'my-hooks)

(add-hook 'prog-mode-hook 'my/configure-prog-mode)

(add-hook 'compilation-filter-hook (lambda ()
                                     (ansi-color-apply-on-region (point-min) (point-max))))
