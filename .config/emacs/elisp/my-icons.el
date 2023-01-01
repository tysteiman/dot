(provide 'my-icons)

(use-package all-the-icons :defer t)

(use-package all-the-icons-dired
  :after all-the-icons
  :init (setq all-the-icons-dired-monochrome nil)
  :hook (dired-mode . all-the-icons-dired-mode))

(use-package all-the-icons-ibuffer
  :after all-the-icons
  :hook (ibuffer-mode . all-the-icons-ibuffer-mode))
