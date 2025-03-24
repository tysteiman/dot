(provide 'my-dashboard)

(use-package dashboard
  :init
  (setq dashboard-startup-banner 3
        dashboard-items '((recents . 10)
                          (bookmarks . 10)
                          (projects . 10)))
  :config
  (dashboard-setup-startup-hook))
