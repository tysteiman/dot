(provide 'my-eglot)

(use-package project
  :defer t)

(use-package eglot
  :defer t
  :bind (("C-c l l" . eglot)
         ("C-c l s" . eglot-shutdown)
         ("C-c l a" . eglot-shutdown-all)))
