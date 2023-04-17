;;; CUSTOM FILE
(setq custom-file (concat user-emacs-directory "custom.el"))

(setq gc-cons-threshold (* 60 1000 1000))

(add-to-list 'load-path (concat user-emacs-directory "modules"))

(require 'my-conf)
(require 'my-hooks)
(require 'my-use-package)
(require 'my-defuns)
(require 'my-git)
(require 'my-prettier)
(require 'my-lsp)

;;; INSTALL PACKAGES
(use-package vterm
  :defer t)

(use-package vertico
  :config (vertico-mode 1))

(use-package orderless
  :after vertico
  :init (setq completion-styles '(orderless)))

(use-package swiper
  :bind (("M-S" . swiper)))

(use-package which-key
  :config (which-key-mode)
  :init (setq which-key-idle-delay 0.5))

(use-package diredfl
  :defer t
  :hook (dired-mode . diredfl-mode))

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config (evil-mode 1))

(use-package evil-collection
  :after evil
  :config (evil-collection-init))

(use-package evil-escape
  :after evil
  :init (setq-default evil-escape-key-sequence "jk")
  :config (evil-escape-mode))

(use-package company
  :init (setq company-dabbrev-downcase nil)
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.5)
  :hook (prog-mode . company-mode))

(use-package hl-todo
  :hook (prog-mode . hl-todo-mode))

(use-package company-box
  :hook (company-mode . company-box-mode))

(use-package js2-mode
  :defer t
  :mode "\\.js\\'")

(use-package emmet-mode
  :defer t
  :config
  (define-key web-mode-map (kbd "C-j") 'emmet-expand-line))

(use-package rjsx-mode
  :defer t
  :init
  (setq js2-mode-show-parse-errors nil)
  (setq js2-mode-show-strict-warnings nil)
  :mode "\\.jsx\\'"
  :config
  (define-key rjsx-mode-map (kbd "C-j") 'emmet-expand-line))

(use-package web-mode
  :defer t
  :mode "\\.erb\\'")

(use-package projectile
  :config (projectile-mode 1))

(use-package rg
  :commands (projectile-ripgrep))

(use-package doom-modeline
  :init (setq doom-modeline-height 40)
        (setq doom-modeline-buffer-file-name-style "file-name")
        (setq doom-modeline-vcs-max-length 40)
  :config (doom-modeline-mode))

(use-package doom-themes
  :config (load-theme 'doom-feather-dark t))

(use-package tree-sitter
  :hook
  (ruby-mode . tree-sitter-hl-mode)
  (php-mode . tree-sitter-hl-mode))

(use-package solaire-mode
  :config (solaire-global-mode +1))

(use-package general
  :config

  (general-define-key
   :keymaps 'override
   :states 'normal
   "M-h" 'windmove-left
   "M-j" 'windmove-down
   "M-k" 'windmove-up
   "M-l" 'windmove-right)

  ;; SHELLS (eshell/vterm)
  (general-define-key
   :prefix "SPC"
   :keymaps '(eshell-mode-map vterm-mode-map)
   :states 'normal
   "r" 'rename-buffer)

  ;; SPC+c (Config)
  (general-define-key
   :prefix "SPC c"
   :keymaps 'override
   :states 'normal
   "m" 'my/open-module
   "c" 'open-config)

  ;; SPC+g (Git)
  (general-define-key
   :prefix "SPC g"
   :keymaps 'override
   :states 'normal
   "m" 'magit-status
   "l" 'my/git-blame-line
   "f" 'my/git-blame-file
   "r" 'my/git-blame-region)

  ;; SPC+k (Bookmarks)
  (general-define-key
   :prefix "SPC k"
   :keymaps 'override
   :states 'normal
   "j" 'bookmark-jump
   "s" 'bookmark-set
   "x" 'bookmark-delete
   "!" 'bookmark-delete-all)

  (general-define-key
   :keymaps '(lsp-mode-map override)
   :states 'normal
   "K" 'lsp-ui-doc-glance
   "=" 'lsp-format-buffer)

  ;; Global space
  (general-define-key
   :prefix "SPC"
   :keymaps 'override
   :states 'normal
   "e" 'find-file
   "f" 'projectile-find-file
   "F" 'projectile-find-file-other-window
   "b" 'switch-to-buffer
   "B" 'ibuffer
   "d" 'dired-jump
   "D" 'dired
   "o" 'delete-other-windows
   "/" 'swiper-thing-at-point
   "?" 'swiper
   "j" 'projectile-switch-project
   "M" 'evil-emacs-state
   "s" 'projectile-ripgrep
   "q" 'delete-window
   "Q" 'my/delete-and-balance-windows
   "v" 'revert-buffer-quick
   "!" 'shell-command
   ";" 'my/comment-current-line
   "," '(execute-extended-command :which-key "M-x")
   "c" '(:ignore t :which-key "Config")
   "g" '(:ignore t :which-key "Git")
   "k" '(:ignore t :which-key "Bookmarks")))

;;; KEY BINDINGS
(global-set-key (kbd "C-x C-b") 'ibuffer) ;; use ibuffer instead of default

;; Recommended by LSP mode
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb
