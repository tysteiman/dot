(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)

(setq use-package-always-ensure t)
;; (setq use-package-verbose t)

(use-package dockerfile-mode
  :defer t)

(use-package yaml-mode
  :hook (yaml-mode . my/configure-prog-mode))

(use-package conf-mode
  :hook (conf-mode . my/configure-prog-mode)
  :mode "\\.env\\'")

(use-package js2-mode
  :defer t
  :mode "\\.js\\'")

(use-package rjsx-mode
  :defer t
  :init
  (setq js2-mode-show-parse-errors nil)
  (setq js2-mode-show-strict-warnings nil)
  :mode "\\.jsx\\'"
  :config
  (define-key rjsx-mode-map (kbd "C-j") 'emmet-expand-line)
  (define-key rjsx-mode-map (kbd "M-.") 'xref-find-definitions)
  (define-key js2-mode-map (kbd "M-.") 'xref-find-definitions))

(use-package php-mode
  :defer t)

(use-package web-mode
  :mode "\\.erb\\'"
  :mode "\\.php\\'"
  :mode "\\.html\\'"
  :mode "\\.ctp\\'"
  :config
  (define-key web-mode-map (kbd "C-j") 'emmet-expand-line))

(use-package markdown-mode
  :defer t
  :hook (markdown-mode . my/configure-prog-mode))

(use-package slim-mode
  :defer t)

(use-package csv-mode
  :defer t
  :hook (csv-mode . csv-align-mode))

(use-package json-mode
  :defer t)

(use-package fish-mode
  :defer t)

(use-package vertico
  :config (vertico-mode 1))

(use-package marginalia
  :after vertico
  :init (marginalia-mode))

(use-package orderless
  :init (setq completion-styles '(orderless)))

(use-package which-key
  :config
  (which-key-mode)
  :diminish which-key-mode
  :init (setq which-key-idle-delay 1))

(use-package helpful
  :bind (("C-h f" . helpful-function)
         ("C-h v" . helpful-variable)
         ("C-h k" . helpful-key)))

(use-package company
  :init (setq company-dabbrev-downcase nil)
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.5)
  :hook (prog-mode . company-mode))

(use-package company-box
  :hook (company-mode . company-box-mode))

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")
  (setq lsp-headerline-breadcrumb-enable nil)
  :config
  (lsp-enable-which-key-integration t)
  :hook
  (c-mode    . lsp-deferred)
  (js2-mode  . lsp-deferred)
  (rust-mode . lsp-deferred)
  (php-mode  . lsp-deferred))

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode))

(use-package lsp-treemacs
  :after lsp)

(use-package prettier
  :after (:any js2-mode rjsx-mode)
  :hook
  (js2-mode  . my/configure-prettier)
  (rjsx-mode . my/configure-prettier))

(use-package tree-sitter
  :hook
  (ruby-mode . tree-sitter-hl-mode)
  (c-mode    . tree-sitter-hl-mode)
  (php-mode  . tree-sitter-hl-mode))

(use-package tree-sitter-langs :defer t)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package emmet-mode
  :defer t)

(use-package rainbow-mode
  :defer t)

(use-package hl-todo
  :hook (prog-mode . hl-todo-mode))

;; (use-package paredit
;;   :hook
;;   (emacs-lisp-mode       . enable-paredit-mode)
;;   (lisp-interaction-mode . enable-paredit-mode)
;;   (lisp-mode             . enable-paredit-mode))

(use-package doom-themes
  :config (load-theme 'doom-palenight t)
  :hook (server-after-make-frame . (lambda ()
                                     (load-theme 'doom-palenight t))))

;; (use-package emacs
;;   :init
;;   :config
;;   (load-theme 'modus-vivendi))

(use-package doom-modeline
  :init
  (setq doom-modeline-height 50)
  (setq doom-modeline-bar-width 5)
  (setq doom-modeline-vcs-max-length 25)
  (setq doom-modeline-buffer-file-name-style "file-name")
  :config (doom-modeline-mode 1))

(use-package solaire-mode
  :config (solaire-global-mode +1))

(use-package diredfl
  :hook (dired-mode . diredfl-mode))

(use-package ibuffer
  :bind (("C-x C-b" . ibuffer))
  :config
  (define-key ibuffer-mode-map (kbd "C-x C-b") 'previous-buffer)
  (define-key ibuffer-mode-map (kbd "q")       'kill-buffer-and-window))

(use-package winner
  :config (winner-mode))

(use-package window-numbering
  :config (window-numbering-mode 1))

(use-package all-the-icons)

(use-package all-the-icons-dired
  :after all-the-icons
  :init (setq all-the-icons-dired-monochrome nil)
  :hook (dired-mode . all-the-icons-dired-mode))

(use-package all-the-icons-ibuffer
  :after all-the-icons
  :hook (ibuffer-mode . all-the-icons-ibuffer-mode))

;; (use-package dashboard
;;   :init
;;   ;; (setq dashboard-startup-banner 'logo)
;;   (setq dashboard-startup-banner (if (display-graphic-p) 'logo (concat user-emacs-directory "banner.txt")))
;;   (setq dashboard-set-heading-icons t)
;; 
;;   (setq initial-buffer-choice (lambda ()
;;                                 (get-buffer "*dashboard*")))
;; 
;;   (setq dashboard-items '((recents . 20)
;;                           (projects . 20)))
;; 
;;   :config
;;   (dashboard-setup-startup-hook)
;;   (dashboard-modify-heading-icons '((projects . "repo")
;;                                     (recents  . "squirrel")))
;;   (global-set-key (kbd "C-c f d") (lambda ()
;;                                     (interactive)
;;                                     (switch-to-buffer "*dashboard*"))))

(use-package org
  :init
  (setq org-startup-folded t)
  (setq org-todo-keywords '((sequence "TODO" "QUESTION" "OPTIONAL" "|" "DONE" "ANSWERED")))
  (setq org-todo-keyword-faces '(("QUESTION" . (:foreground "indianred"))
                                 ("OPTIONAL" . (:foreground "tan"))))
  :config
  (require 'org-tempo)
  (add-to-list 'org-structure-template-alist '("el"   . "src elisp"))
  (add-to-list 'org-structure-template-alist '("rb"   . "src ruby"))
  (add-to-list 'org-structure-template-alist '("js"   . "src javascript"))
  (add-to-list 'org-structure-template-alist '("json" . "src json"))
  :bind (("C-c t i" . org-timer-set-timer)
         ("C-c t s" . org-timer-stop))
  :hook
  (org-mode . org-indent-mode)
  (org-mode . toggle-truncate-lines))

(use-package evil
  :hook
  (prog-mode        . turn-on-evil-mode)
  (org-mode         . turn-on-evil-mode)
  (conf-mode        . turn-on-evil-mode)
  (yaml-mode        . turn-on-evil-mode)
  (slim-mode        . turn-on-evil-mode)
  (vterm-mode       . turn-on-evil-mode)
  (eshell-mode      . turn-on-evil-mode)
  (git-commit-setup . turn-on-evil-mode)
  (csv-mode         . turn-on-evil-mode)
  (help-mode        . turn-on-evil-mode)
  (helpful-mode     . turn-on-evil-mode)
  (markdown-mode    . turn-on-evil-mode)
  (evil-after-load  . (lambda ()
                        (define-key evil-normal-state-map (kbd "SPC") 'projectile-find-file)
                        (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
                        (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
                        (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
                        (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right))))

(use-package evil-org
  :after org
  :hook (org-mode . evil-org-mode)
  :config (evil-org-set-key-theme '(navigation insert textobjects additional claendar)))

(use-package evil-escape
  :after evil
  :init (setq-default evil-escape-key-sequence "jk")
  :config (evil-escape-mode))

(use-package eshell-info-banner
  :defer t
  :hook (eshell-banner-load . eshell-info-banner-update-banner))

(use-package eshell-git-prompt
  :config (eshell-git-prompt-use-theme 'git-radar))

(use-package vterm
  :init (setq vterm-shell "/usr/bin/fish")
  :bind (("C-c e v" . my/vterm)
         ("C-c d u" . my/launch-docker-project)
         ("C-c d r" . my/launch-rails-docker-project)
         ("C-c d y" . my/launch-yarn-project)
         ("C-c d c" . my/launch-rails-console)
         ("C-c d a" . my/launch-rails-bash)))

(use-package projectile
  :config
  (projectile-mode 1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package swiper
  :bind (("C-M-s" . swiper)))

(use-package rg
  :commands (projectile-ripgrep))

(use-package magit
  :commands magit-status
  :bind (("C-c m s" . magit-status)
         ("C-M-i"   . magit-status)
         ("C-c m b" . magit-blame)))

(use-package diff-hl
  :after magit
  :hook (magit-post-refresh . diff-hl-magit-post-refresh))

(use-package flyspell
  :hook (org-mode . my/flyspell))

(use-package pulseaudio-control
  :config (pulseaudio-control-default-keybindings))

(use-package sudo-edit
  :defer t)

(use-package dictionary
  :defer t)

(use-package docker
  :defer t)

(use-package windmove
  :config
  (windmove-default-keybindings)
  (windmove-mode 1))

(use-package rust-mode)
