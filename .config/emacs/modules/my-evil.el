(provide 'my-evil)

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
                        (evil-define-key nil evil-normal-state-map " " 'projectile-find-file)
                        (evil-define-key nil evil-normal-state-map "t" 'evil-next-line)
                        (evil-define-key nil evil-normal-state-map "n" 'evil-previous-line)
                        (evil-define-key nil evil-normal-state-map "s" 'evil-forward-char))))

(use-package evil-org
  :after org
  :hook (org-mode . evil-org-mode)
  :config (evil-org-set-key-theme '(navigation insert textobjects additional claendar)))

(use-package evil-escape
  :after evil
  :init (setq-default evil-escape-key-sequence "ht")
  :config (evil-escape-mode))
