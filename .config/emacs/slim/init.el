;;; CUSTOM FILE
(setq custom-file (concat user-emacs-directory "custom.el"))

(set-face-attribute 'default nil :height 130 :family "agave Nerd Font")

;; (set-frame-parameter (selected-frame) 'alpha '(90 90))
;; (add-to-list 'default-frame-alist '(alpha 90 90))

(column-number-mode)
(display-time-mode)
;; (windmove-default-keybindings)
(winner-mode)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(menu-bar-mode 0)

;;; SET VARIABLES
(setq make-backup-files nil
      create-lockfiles nil
      vc-follow-symlinks t
      dired-listing-switches "-lAh"
      shr-use-colors nil   ;; eww
      shr-inhibit-images t ;; eww
      shr-use-fonts nil    ;; eww
      compilation-scroll-output t
      visible-bell nil
      ring-bell-function 'ignore
      ruby-insert-encoding-magic-comment nil
      org-startup-folded t
      set-mark-command-repeat-pop t
      mark-ring-max 8
      global-mark-ring-max 8)

(setq-default truncate-lines t
              indent-tabs-mode nil
              c-basic-offset 4
              js-indent-level 4
              sgml-basic-offset 4)

;;; HOOKS
;; configure prog mode
(add-hook 'prog-mode-hook (lambda ()
                            (setq show-trailing-whitespace t)))

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
   "f" 'projectile-find-file
   "F" 'projectile-find-file-other-window
   "g" 'magit-status
   "b" 'switch-to-buffer
   "B" 'ibuffer
   "d" 'dired-jump
   "D" 'dired
   "o" 'delete-other-windows
   "/" 'swiper-thing-at-point
   "j" 'projectile-switch-project
   "s" 'projectile-ripgrep
   "q" 'delete-window
   "V" 'revert-buffer-quick
   "!" 'shell-command
   "," '(execute-extended-command :which-key "M-x")
   "k" '(:ignore t :which-key "Bookmarks")))

;;; KEY BINDINGS
(global-set-key (kbd "C-x C-b") 'ibuffer) ;; use ibuffer instead of default

;;; DEFUNS
;; write some defuns
(defun open-config ()
  "Open Emacs init.el"
  (interactive)
  (find-file (concat user-emacs-directory "init.el")))

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

;;; PUTS
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
