(provide 'my-evil)

(defun my--evil-key-entry (key func)
  (evil-define-key nil evil-normal-state-map key func))

(defun my/set-evil-keys ()
  (my--evil-key-entry " f" 'projectile-find-file)
  (my--evil-key-entry " s" 'projectile-ripgrep)
  (my--evil-key-entry " g" 'magit-status)
  (my--evil-key-entry " l" 'eshell)
  (my--evil-key-entry " k" 'projectile-compile-project)
  (my--evil-key-entry " o" 'delete-other-windows)
  (my--evil-key-entry " j" 'projectile-switch-project))

(use-package evil
  :config
  (setq evil-normal-state-cursor '("#7aa2f7" box))
  (setq evil-insert-state-cursor '("#73daca" (bar . 2)))
  (setq evil-visual-state-cursor '("#e0af68" box))
  (setq evil-emacs-state-cursor '("#bb9af7" box))
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
  :config (evil-org-set-key-theme '(navigation insert textobjects additional calendar)))

(use-package evil-escape
  :defer 1
  :after evil
  :init (setq-default evil-escape-key-sequence "jk")
  :config (evil-escape-mode))
