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

(use-package dockerfile-mode)

(use-package magit
  :bind (("C-c m s" . magit-status)
         ("C-M-i"   . magit-status)
         ("C-c m b" . magit-blame)))

(use-package yaml-mode
  :hook (yaml-mode . my/configure-prog-mode))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package doom-themes
  :config (load-theme 'doom-one t))

(use-package doom-modeline
  :init
  (setq doom-modeline-height 50)
  (setq doom-modeline-vcs-max-length 25)
  (setq doom-modeline-buffer-file-name-style "file-name")
  :config (doom-modeline-mode 1)
  )

(use-package evil
  :hook
  (prog-mode        . turn-on-evil-mode)
  (org-mode         . turn-on-evil-mode)
  (conf-mode        . turn-on-evil-mode)
  (yaml-mode        . turn-on-evil-mode)
  (git-commit-setup . turn-on-evil-mode))

(use-package evil-escape
  :after evil
  :init (setq-default evil-escape-key-sequence "jk")
  :config (evil-escape-mode))

(use-package company
  :config (global-company-mode))

(use-package swiper
  :bind (("C-M-s" . swiper)))

(use-package window-numbering
  :config (window-numbering-mode 1))

(use-package rjsx-mode
  :init
  (setq js2-mode-show-parse-errors nil)
  (setq js2-mode-show-strict-warnings nil)
  :config
  (add-to-list 'auto-mode-alist '("\\.js"  . js2-mode))
  (add-to-list 'auto-mode-alist '("\\.jsx" . rjsx-mode))
  (define-key rjsx-mode-map (kbd "C-j") 'emmet-expand-line)
  (define-key rjsx-mode-map (kbd "M-.") 'xref-find-definitions)
  (define-key js2-mode-map (kbd "M-.") 'xref-find-definitions))

(use-package emmet-mode)

(use-package php-mode)

(use-package web-mode
  :after emmet-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.erb" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.php" . web-mode))
  (define-key web-mode-map (kbd "C-j") 'emmet-expand-line))

(use-package sudo-edit)

(use-package rg)

(use-package org)

(use-package ibuffer
  :config
  (define-key ibuffer-mode-map (kbd "C-x C-b") 'previous-buffer)
  (define-key ibuffer-mode-map (kbd "q")       'kill-buffer-and-window))

(use-package vterm
  :bind (("C-c e v" . vterm)))

(use-package markdown-mode)

(use-package vimrc-mode)

(use-package hide-mode-line
  :bind (("C-c t m" . hide-mode-line-mode)))

(use-package pulseaudio-control
  :config (pulseaudio-control-default-keybindings))

(use-package dictionary)

(use-package diff-hl
  :hook
  (magit-post-refresh . diff-hl-magit-post-refresh)
  )
