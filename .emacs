(setq custom-file "~/.emacs.d/custom.el")
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(tool-bar-mode 0)
(menu-bar-mode 0)
(column-number-mode t)
(scroll-bar-mode 0)
(show-paren-mode)
(display-time-mode)
(auto-revert-mode t)

(setq make-backup-files nil)
(setq ns-pop-up-frames nil)
(setq vc-follow-symlinks t)
(setq tags-revert-without-query t)
(setq ruby-insert-encoding-magic-comment nil)
(setq inhibit-startup-message t)
(setq dired-listing-switches "-lah")
(setq js2-mode-show-parse-errors nil)
(setq js2-mode-show-strict-warnings nil)

(setq-default truncate-lines t)
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)
(setq-default js-indent-level 4)
(setq-default sgml-basic-offset 4)

(column-number-mode)

(global-display-line-numbers-mode t)

;; turn off line numbers for some things
(dolist (mode '(org-mode-hook
                term-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; DEFUNS
(defun my/open-initfile ()
  (interactive)
  (find-file "~/.emacs"))

;; KEY BINDINGS
(global-set-key (kbd "C-c f d") 'my/open-initfile)
(global-set-key (kbd "C-c e s") 'eshell)

;; INSTALL PACKAGES (use-package declarations)
(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)

(setq use-package-always-ensure t)

(use-package projectile)

(use-package ivy
  :config (ivy-mode 1))

(use-package fzf
  :bind (("C-c p f" . fzf-projectile)))

(use-package web-mode)

(use-package dockerfile-mode)

(use-package magit
  :bind (("C-c m s" . magit-status)))

(use-package yaml-mode)

(use-package gruvbox-theme
  :config (load-theme 'gruvbox-dark-hard t))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config (setq which-key-idle-delay 0.3))

(use-package counsel
  :bind (("M-x" . counsel-M-x)))

(use-package ivy-rich
  :init (ivy-rich-mode 1))

(use-package powerline
  :config (powerline-default-theme))

(use-package evil
  :bind (("C-c e v" . evil-mode))
  :init (evil-mode 0)
  :config
  (define-key evil-insert-state-map (kbd "jk") 'evil-normal-state))

(use-package eshell-git-prompt
  :config (eshell-git-prompt-use-theme 'powerline))

(use-package airline-themes
  :config (load-theme 'airline-term t))

(use-package company
  :config (global-company-mode))
