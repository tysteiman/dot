(use-package all-the-icons)

(use-package all-the-icons-dired
  :after all-the-icons
  :init
  (setq all-the-icons-dired-monochrome nil)
  :hook
  (dired-mode . all-the-icons-dired-mode))

(use-package all-the-icons-ibuffer
  :after all-the-icons
  :hook
  (ibuffer-mode . all-the-icons-ibuffer-mode))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode))

(use-package ivy-posframe
  :init
  (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-top-center)))
  (setq ivy-posframe-height-alist '((swiper . 20)))
  (setq ivy-posframe-width 100)
  (setq ivy-posframe-parameters
        '((left-fringe . 20)
          (right-fringe . 20)))
  :config (ivy-posframe-mode 1)
  )

(use-package eshell-git-prompt
  :config
  (eshell-git-prompt-use-theme 'multiline))
