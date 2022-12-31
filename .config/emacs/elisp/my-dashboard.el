(use-package dashboard
  :init
  ;; (setq dashboard-startup-banner 'logo)
  (setq dashboard-startup-banner (if (display-graphic-p) 'logo (concat user-emacs-directory "banner.txt")))
  (setq dashboard-set-heading-icons t)

  (setq initial-buffer-choice (lambda ()
                                (get-buffer "*dashboard*")))

  (setq dashboard-items '((recents . 20)
                          (projects . 20)))

  :config
  (dashboard-setup-startup-hook)
  (dashboard-modify-heading-icons '((projects . "repo")
                                    (recents  . "squirrel")))
  (global-set-key (kbd "C-c f d") (lambda ()
                                    (interactive)
                                    (switch-to-buffer "*dashboard*"))))
