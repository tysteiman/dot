(setq custom-file "~/.emacs.d/custom.el")

(setq inhibit-startup-message t)

(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

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
(setq dired-listing-switches "-lah")

(setq-default truncate-lines t)
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)
(setq-default js-indent-level 4)
(setq-default sgml-basic-offset 4)

(defun my/open-initfile ()
  (interactive)
  (find-file "~/.emacs"))

(global-set-key (kbd "C-c f d") 'my/open-initfile)

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
