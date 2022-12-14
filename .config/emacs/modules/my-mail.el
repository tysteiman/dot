(provide 'my-mail)

(use-package mu4e
  :ensure nil
  :load-path "/usr/share/emacs/site-lisp/mu4e/"
  :config
  (setq smtpmail-smtp-server "smtp.gmail.com")
  (setq user-mail-address "tsteiman@switchboxinc.com")
  (setq mu4e-change-filenames-when-moving t)
  (setq mu4e-update-interval (* 5 60))
  (setq mu4e-get-mail-command "mbsync -a")
  (setq mu4e-maildir "~/Mail")
  (setq mu4e-drafts-folder "/[Gmail].Drafts")
  (setq mu4e-sent-folder "/[Gmail].Sent Mail")
  (setq mu4e-refile-folder "/[Gmail].All Mail")
  (setq mu4e-trash-folder "/[Gmail].Trash")
  (setq mu4e-compose-format-flowed t)
  :bind (("C-c m m" . mu4e))
  :hook (mu4e-compose-mode . turn-off-auto-fill))

(use-package mu4e-alert
  :after mu4e
  :config
  (mu4e-alert-enable-notifications)
  (mu4e-alert-enable-mode-line-display))
