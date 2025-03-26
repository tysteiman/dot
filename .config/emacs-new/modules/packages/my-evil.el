(provide 'my-evil)

(use-package evil
  :bind (("C-c u e" . evil-mode)))

(use-package evil-surround
  :hook (evil-mode . evil-surround-mode))
