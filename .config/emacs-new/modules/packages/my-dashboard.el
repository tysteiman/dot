(provide 'my-dashboard)

(use-package dashboard
  :demand t
  :init
  (setq dashboard-startup-banner (concat user-emacs-directory "banner.txt")
        dashboard-items '((recents . 10)
                          (bookmarks . 10)
                          (projects . 10)))
  :config
  (dashboard-setup-startup-hook)
  :bind (("C-c o d" . dashboard-open)))
