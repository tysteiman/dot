(provide 'my-evil)

(use-package evil
  :init
  (setq evil-normal-state-cursor '("#7aa2f7" box))
  (setq evil-insert-state-cursor '("#73daca" (bar . 2)))
  (setq evil-visual-state-cursor '("#e0af68" box))
  (setq evil-emacs-state-cursor '("#bb9af7" box))
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
  :defer 1
  :after evil
  :init (setq-default evil-escape-key-sequence "jk")
  :config (evil-escape-mode))
