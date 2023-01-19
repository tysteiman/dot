(provide 'my-vertico)

(use-package vertico
  :init (setq vertico-count 20)
  :config (vertico-mode 1))

;; (use-package vertico-posframe
;;   :init (setq vertico-posframe-width 120
;;               vertico-posframe-border-width 10
;;               vertico-count 20)
;;   :hook
;;   (server-after-make-frame . vertico-posframe-mode)
;;   (magit-post-refresh . posframe-delete-all))

(use-package marginalia
  :after vertico
  :config (marginalia-mode)
  :init (setq marginalia-align 'right))

(use-package orderless
  :after vertico
  :init (setq completion-styles '(orderless)))
