;; INSTALL PACKAGES (use-package declarations)
(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;; install use-package -- the only package we install 'manually'
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)

(setq use-package-always-ensure t)

(use-package projectile
  :config
  (projectile-mode 1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package ivy
  :config (ivy-mode 1))

(use-package web-mode
  :after emmet-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.html.erb" . web-mode))
  (define-key web-mode-map (kbd "C-j") 'emmet-expand-line))

(use-package dockerfile-mode)

(use-package magit
  :bind (("C-c m s" . magit-status)
         ("C-c m b" . magit-blame)))

(use-package yaml-mode)

(use-package gruvbox-theme
  :config (load-theme 'gruvbox-dark-hard t))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config (setq which-key-idle-delay 1))

(use-package counsel
  :bind (("M-x" . counsel-M-x)))

(use-package ivy-rich
  :init (ivy-rich-mode 1))

(use-package eshell-git-prompt
  :config (eshell-git-prompt-use-theme 'powerline))

(use-package airline-themes
  :config (load-theme 'airline-term t))

(use-package all-the-icons)

(use-package doom-modeline
  :init
  (setq doom-modeline-height 30)
  (setq doom-modeline-vcs-max-length 25)
  :config
  (doom-modeline-mode 1))

(use-package evil
  :bind (("C-c e v" . evil-mode))
  :init (evil-mode 0)
  :config
  (define-key evil-insert-state-map (kbd "jk") 'evil-normal-state))

(use-package company
  :config (global-company-mode))

(use-package swiper
  :bind (("C-c s s" . swiper)))

(use-package window-numbering
  :config (window-numbering-mode 1))

(use-package rjsx-mode
  :init
  (setq js2-mode-show-parse-errors nil)
  (setq js2-mode-show-strict-warnings nil)
  :config
  (add-to-list 'auto-mode-alist '("\\.js" . js2-mode))
  (add-to-list 'auto-mode-alist '("\\.jsx" . rjsx-mode)))

(use-package emmet-mode)

(use-package slim-mode)

(use-package sudo-edit)

(use-package dashboard
  :init
  (setq dashboard-startup-banner (concat user-emacs-directory "arch-logo.txt"))
  (setq dashboard-items '((recents . 5)
                          (projects . 5)))
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  :config
  (dashboard-modify-heading-icons '((recents . "file-text")
                                    (projects . "book")))
  (dashboard-setup-startup-hook))

(use-package rg)

(use-package diff-hl
  :after magit
  :config
  (global-diff-hl-mode)
  :hook
  (magit-post-refresh . diff-hl-magit-post-refresh))