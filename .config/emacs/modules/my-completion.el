(provide 'my-completion)

(use-package vertico
  :config (vertico-mode 1))

(use-package marginalia
  :after vertico
  :config (marginalia-mode)
  :init (setq marginalia-align 'right))

(use-package orderless
  :init (setq completion-styles '(orderless)))

(use-package company
  :init (setq company-dabbrev-downcase nil)
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.5)
  :hook (prog-mode . company-mode)
  :bind (("C-M-c" . company-complete)))

(use-package company-box
  :hook (company-mode . company-box-mode))

(use-package smartparens
  :hook (prog-mode . smartparens-mode))

(use-package emmet-mode
  :defer t)

