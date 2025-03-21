(provide 'my-dashboard)

(use-package dashboard
  :init
  (setq dashboard-startup-banner 3
        dashboard-items '((recents . 20)
                          (bookmarks . 20)
                          (projects . 20)))
  :config
  (dashboard-setup-startup-hook))
