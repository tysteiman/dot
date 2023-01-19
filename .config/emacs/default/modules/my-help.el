(provide 'my-help)

(use-package which-key
  :config
  (which-key-mode)
  :diminish which-key-mode
  :init (setq which-key-idle-delay 0.5))

(use-package helpful
  :defer t
  :bind (("C-h f" . helpful-function)
         ("C-h v" . helpful-variable)
         ("C-h k" . helpful-key)))
