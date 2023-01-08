(provide 'my-completion)

(use-package company
  :init (setq company-dabbrev-downcase nil)
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay nil)
  :hook
  (prog-mode . company-mode)
  (evil-after-load . (lambda ()
                       (evil-define-key nil evil-insert-state-map "\C-n" 'company-complete)))
  :bind (("C-M-c" . company-complete)))

(use-package emmet-mode
  :defer t)

(use-package smartparens
  :hook (prog-mode . smartparens-mode))
