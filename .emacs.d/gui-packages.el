(use-package which-key
  :config
  (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))

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

(use-package diredfl
  :config
  (diredfl-global-mode))

(use-package ivy-rich
  :after ivy
  :init
  (ivy-rich-mode 1))

(use-package counsel
  :after ivy-rich
  :bind (("M-x"   . counsel-M-x)
         ("C-x b" . counsel-switch-buffer)))

(use-package eshell-git-prompt
  :config
  (eshell-git-prompt-use-theme 'multiline))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode))

;; (use-package diff-hl
;;   :after magit
;;   :config
;;   (global-diff-hl-mode)
;;   (diff-hl-margin-mode)
;;   :hook
;;   (magit-post-refresh . diff-hl-magit-post-refresh))
