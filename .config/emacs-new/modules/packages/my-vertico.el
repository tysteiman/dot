(provide 'my-vertico)

(use-package vertico
  :config (vertico-mode 1))

(use-package marginalia
  :after vertico
  :config (marginalia-mode)
  :init (setq marginalia-align 'right))

(use-package orderless
  :after vertico
  :init (setq completion-styles '(orderless)))
