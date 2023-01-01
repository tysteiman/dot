(provide 'my-vertico)

(use-package vertico
  :config (vertico-mode 1))

(use-package vertico-posframe
  :defer t
  :init
  (setq vertico-posframe-width 100)
  (setq vertico-posframe-parameters '((left-fringe . 10)
                                      (right-fringe . 20)))
  :hook (server-after-make-frame . (lambda ()
                                     (vertico-posframe-mode 1)
                                     (posframe-delete-all))))

(use-package marginalia
  :after vertico
  :config (marginalia-mode)
  :init (setq marginalia-align 'right))

(use-package orderless
  :init (setq completion-styles '(orderless)))

