(provide 'my-evil)

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :config (evil-collection-init))

(use-package evil-org
  :after org
  :hook (org-mode . evil-org-mode)
  :config (evil-org-set-key-theme '(navigation insert textobjects additional calendar)))

(use-package evil-escape
  :after evil
  :init (setq-default evil-escape-key-sequence "jk")
  :config (evil-escape-mode))
