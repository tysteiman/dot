;;; CUSTOM FILE
(setq custom-file (concat user-emacs-directory "custom.el"))

(setq gc-cons-threshold (* 60 1000 1000))

(add-to-list 'load-path (concat user-emacs-directory "modules"))

;; TODO modules ftw
(require 'my-conf)
(require 'my-defuns)

;;; HOOKS
;; configure prog mode
(add-hook 'prog-mode-hook (lambda ()
                            (setq show-trailing-whitespace t)
                            (hl-line-mode)))

(add-hook 'org-mode-hook (lambda ()
                           (org-indent-mode)
                           (setq truncate-lines nil)))

(add-hook 'compilation-filter-hook (lambda ()
                                     (ansi-color-apply-on-region (point-min) (point-max))))

;;; INSTALL USE-PACKAGE
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;; get ready for emacs 29!
(unless (package-installed-p 'use-package)
  ;; TODO when looking to emacs 29, if use-package really is built in, we can use that OOTB.
  (package-install 'use-package))

(require 'use-package)

(setq use-package-always-ensure t)
;; (setq use-package-verbose t)

;;; INSTALL PACKAGES
(use-package magit
  :bind (("C-c m" . magit-status)))

(use-package diff-hl
  :hook
  (magit-post-refresh . diff-hl-magit-post-refresh)
  (prog-mode . diff-hl-margin-mode)
  (prog-mode . diff-hl-mode))

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

(defun my/configure-prettier ()
  "Configure Prettier by turning it on only if there is a pretterrc file in the projectile root"
  (let ((prettier-rc (concat (projectile-project-root) ".prettierrc.json")))
    (if (file-exists-p prettier-rc)
        (prettier-mode 1)
      (message ".prettierrc.json not detected in project root -- skipped loading."))))

(use-package prettier
  :after (:any js2-mode rjsx-mode)
  :hook
  (js2-mode  . my/configure-prettier)
  (rjsx-mode . my/configure-prettier))

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

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")
  (setq lsp-headerline-breadcrumb-enable nil)
  :config (lsp-enable-which-key-integration t)
  :hook
  (typescript-mode . lsp-deferred)
  (js2-mode        . lsp-deferred)
  (php-mode        . lsp-deferred))

(use-package lsp-ui
  :init (setq lsp-ui-doc-position 'at-point)
  :hook (lsp-mode . lsp-ui-mode))

(use-package doom-modeline
  :init (setq doom-modeline-height 40)
        (setq doom-modeline-buffer-file-name-style "file-name")
        (setq doom-modeline-vcs-max-length 40)
  :config (doom-modeline-mode))

(use-package doom-themes
  :config (load-theme 'doom-one t))

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
   "m" 'my/open-module
   "M" 'evil-emacs-state
   "s" 'projectile-ripgrep
   "q" 'delete-window
   "Q" 'my/delete-and-balance-windows
   "v" 'revert-buffer-quick
   "!" 'shell-command
   ";" 'my/comment-current-line
   "," '(execute-extended-command :which-key "M-x")
   "g" '(:ignore t :which-key "Git")
   "k" '(:ignore t :which-key "Bookmarks")))

;;; KEY BINDINGS
(global-set-key (kbd "C-x C-b") 'ibuffer) ;; use ibuffer instead of default

;;; DEFUNS
;; write some defuns
(defun open-config ()
  "Open Emacs init.el"
  (interactive)
  (find-file (concat user-emacs-directory "init.el")))

(defun my/delete-and-balance-windows ()
  "Delete current window and balance windows"
  (interactive)
  (delete-window)
  (balance-windows))

(defun my/comment-current-line ()
  "Comment current line while keeping point the same."
  (interactive)
  (save-excursion
    (comment-line 1)))

(defun my/git-blame-line ()
  "Run git blame on current line in file"
  (interactive)
  (let ((linum (line-number-at-pos))
        (file (buffer-file-name)))
    (shell-command (format "git blame -L%s,%s %s" linum linum file) "*Git blame*")))

(defun my/git-blame-file ()
  "Run git blame on current file"
  (interactive)
  (let ((file (buffer-file-name)))
    (shell-command (format "git blame %s" file) "*Git blame*")))

(defun my/git-blame-region ()
  "Run git blame on active region"
  (interactive)
  (let ((beg (line-number-at-pos (region-beginning)))
        (end (line-number-at-pos (region-end)))
        (file (buffer-file-name)))
    (if (region-active-p)
        (shell-command (format "git blame -L%s,%s %s" beg end file) "*Git blame*")
      (message "No active region."))))

;; Recommended by LSP mode
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb
