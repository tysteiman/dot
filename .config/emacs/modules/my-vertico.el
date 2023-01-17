(provide 'my-vertico)

(use-package vertico
  :defer 1
  :config (vertico-mode 1))

(use-package vertico-posframe
  :after vertico
  :init (setq vertico-posframe-width 120
              vertico-posframe-border-width 10
              vertico-count 20)
  :config (vertico-posframe-mode 1))

(use-package marginalia
  :after vertico
  :config (marginalia-mode)
  :init (setq marginalia-align 'right))

(use-package orderless
  :after vertico
  :init (setq completion-styles '(orderless)))
