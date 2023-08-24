(provide 'my-eglot)

(use-package project
  :defer t)

(use-package eglot
  :defer t
  :config (with-eval-after-load 'eglot
            (add-to-list 'eglot-server-programs '(php-mode . ("intelephense" "--stdio"))))
  :bind (("C-c l l" . eglot)
         ("C-c l s" . eglot-shutdown)
         ("C-c l a" . eglot-shutdown-all)))
