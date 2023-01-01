(provide 'my-evil)

(defun my--evil-key-entry (key func)
  (evil-define-key nil evil-normal-state-map key func))

(defun my/set-evil-keys ()
  (my--evil-key-entry " f" 'projectile-find-file)
  (my--evil-key-entry " b" 'switch-to-buffer)
  (my--evil-key-entry " s" 'projectile-ripgrep)
  (my--evil-key-entry " g" 'magit-status)
  (my--evil-key-entry " l" 'eshell)
  (my--evil-key-entry " d" 'dired-jump)
  (my--evil-key-entry " j" 'projectile-switch-project))

(use-package evil
  :hook
  (prog-mode        . turn-on-evil-mode)
  (org-mode         . turn-on-evil-mode)
  (conf-mode        . turn-on-evil-mode)
  (yaml-mode        . turn-on-evil-mode)
  (slim-mode        . turn-on-evil-mode)
  (vterm-mode       . turn-on-evil-mode)
  (eshell-mode      . turn-on-evil-mode)
  (git-commit-setup . turn-on-evil-mode)
  (csv-mode         . turn-on-evil-mode)
  (help-mode        . turn-on-evil-mode)
  (helpful-mode     . turn-on-evil-mode)
  (markdown-mode    . turn-on-evil-mode)
  (evil-after-load  . (lambda ()
                        (my/set-evil-keys))))

(use-package evil-org
  :after org
  :hook (org-mode . evil-org-mode)
  :config (evil-org-set-key-theme '(navigation insert textobjects additional claendar)))

(use-package evil-escape
  :after evil
  :init (setq-default evil-escape-key-sequence "jk")
  :config (evil-escape-mode))
