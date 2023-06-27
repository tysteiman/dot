(provide 'my-eglot)

(use-package project
  :defer t)

(use-package eglot
  :defer t)

(use-package company
  :after eglot
  :init (setq company-dabbrev-downcase nil)
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.5)
  :hook (eglot-server-initialized . company-mode))
