(provide 'my-hooks)

;; prog mode setup hook
(add-hook 'prog-mode-hook 'my/configure-prog-mode)

;; apply compilation buffer colors so it's not all escaped characters and unreadable
(add-hook 'compilation-filter-hook (lambda ()
                                     (ansi-color-apply-on-region (point-min) (point-max))))
