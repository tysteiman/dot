(setq custom-file (concat user-emacs-directory "custom.el"))
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024))

(load-theme 'modus-vivendi t)
(set-cursor-color "yellow")

;; (set-face-attribute 'default nil :height 150 :family "JetBrainsMono Nerd Font Mono")
;; (set-face-attribute 'default nil :height 150 :family "GoMono Nerd Font Mono")
(set-face-attribute 'default nil :height 160 :family "Agave Nerd Font Mono")

(column-number-mode)
(display-time-mode)
(winner-mode)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(menu-bar-mode 0)
(fset 'yes-or-no-p 'y-or-n-p)
(fringe-mode 3)

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
      global-mark-ring-max 8
      native-comp-async-report-warnings-errors nil
      inhibit-startup-screen t)

(setq-default truncate-lines t
              indent-tabs-mode nil
              c-basic-offset 4
              js-indent-level 2
              sgml-basic-offset 4)

;;; PUTS
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'erase-buffer 'disabled nil)

;; DEFUNS
(defun my/open-init ()
  "Open Emacs init.el file"
  (interactive)
  (find-file (concat user-emacs-directory "init.el")))

(defun my/npm-test-project ()
  "Test the current project using npm run test"
  (interactive)
  (async-shell-command
   "npm run test"
   "*npm test*"
   "*npm test ERROR*"))

(defun my/npm-test-file ()
  "Test the current file using npm run test <file>"
  (interactive)
  (async-shell-command
   (concat "npm run test " buffer-file-name)
   "*npm test*"
   "*npm test ERROR*"))

;; KEYBINDINGS
(global-set-key (kbd "C-c o i") 'my/open-init)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "M-h") 'windmove-left)
(global-set-key (kbd "M-l") 'windmove-right)
(global-set-key (kbd "M-k") 'windmove-up)
(global-set-key (kbd "M-j") 'windmove-down)

(global-set-key (kbd "C-M-1") 'delete-other-windows)

;; hooks
(add-hook 'compilation-filter-hook (lambda ()
                                     (ansi-color-apply-on-region (point-min) (point-max))))

(add-hook 'prog-mode-hook (lambda ()
                            (setq show-trailing-whitespace t)
                            (hl-line-mode 1)))

;; PACKAGES
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package doom-themes
  :defer t)

(use-package typescript-mode
  :mode ("\\.ts\\'" "\\.js\\'"))

(use-package vertico
  :init (setq vertico-count 10)
  :config (vertico-mode 1))

(use-package marginalia
  :after vertico
  :config (marginalia-mode)
  :init (setq marginalia-align 'right))

(use-package orderless
  :after vertico
  :init (setq completion-styles '(orderless)))

(use-package lsp-mode
  :init (setq lsp-headerline-breadcrumb-enable nil
              lsp-keymap-prefix "C-c l"
              lsp-enable-dap-auto-configure nil)
  :hook (typescript-mode . lsp))

(use-package lsp-java
  :after lsp-mode
  :hook (java-mode . lsp))

(use-package projectile
  :config
  (projectile-mode 1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(defun my/configure-prettier ()
  "Configure Prettier by turning it on only if there is a pretterrc file in the projectile root"
  (let ((prettier-rc (concat (projectile-project-root) ".prettierrc")))
    (if (file-exists-p prettier-rc)
        (prettier-mode 1)
      (message ".prettierrc not detected in project root -- skipped loading."))))

(use-package prettier
  :after (:any typescript-mode)
  :hook (typescript-mode . my/configure-prettier))

(use-package magit
  :bind (("C-c m" . magit-status)))

(use-package diff-hl
  :defer t
  :hook
  (prog-mode . diff-hl-mode)
  (magit-pre-refresh . diff-hl-magit-pre-refresh)
  (magit-post-refresh . diff-hl-magit-post-refresh))

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

;; (use-package doom-modeline
;;   :init (setq doom-modeline-height 25
;;               doom-modeline-icon t
;;               doom-modeline-buffer-file-name-style 'file-name
;;               doom-modeline-vcs-max-length 50
;;               doom-modeline-env-enable-ruby nil
;;               doom-modeline-time-icon nil)
;;   :config (doom-modeline-mode t))

(use-package company
  :init (setq company-dabbrev-downcase nil)
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.5)
  :hook (prog-mode . company-mode))

;; (use-package company-box
;;   :after (company)
;;   :hook (company-mode . company-box-mode))

;; (use-package diredfl
;;   :hook (dired-mode . diredfl-mode))

;; (use-package hl-todo
;;   :hook (prog-mode . hl-todo-mode))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; (use-package which-key
;;   :config
;;   (which-key-mode)
;;   :init (setq which-key-idle-delay 0.5))

(use-package swiper
  :bind (("C-M-/" . swiper-thing-at-point)))

(use-package rg
  :commands (projectile-ripgrep))

(use-package dockerfile-mode :defer t)
(use-package yaml-mode :defer t)
(use-package conf-mode :mode "\\.env\\'")
(use-package php-mode :defer t)
(use-package json-mode :defer t)

;; org
(use-package org
  :defer t
  :init
  (setq org-startup-folded t))

;; (use-package org
;;   :defer t
;;   :init
;;   (setq org-startup-folded t)
;;   (setq org-todo-keywords '((sequence "TODO" "IN PROGRESS" "QUESTION" "OPTIONAL" "|" "DONE" "ANSWERED")))
;;   (setq org-todo-keyword-faces '(("QUESTION" . (:foreground "indianred"))
;;                                  ("OPTIONAL" . (:foreground "tan"))
;;                                  ("IN PROGRESS" . (:foreground "aqua"))))
;;   :config
;;   (require 'org-tempo)
;;   (add-to-list 'org-structure-template-alist '("el"   . "src elisp"))
;;   (add-to-list 'org-structure-template-alist '("rb"   . "src ruby"))
;;   (add-to-list 'org-structure-template-alist '("js"   . "src javascript"))
;;   (add-to-list 'org-structure-template-alist '("json" . "src json"))
;;   (add-to-list 'org-structure-template-alist '("html" . "src html"))
;;   (add-to-list 'org-structure-template-alist '("php" . "src php"))
;;   (add-to-list 'org-structure-template-alist '("java" . "src java"))
;;   (add-to-list 'org-structure-template-alist '("c" . "src c"))
;;   :bind (("C-c t i" . org-timer-set-timer)
;;          ("C-c t s" . org-timer-stop))
;;   :hook
;;   (org-mode . org-indent-mode)
;;   (org-mode . toggle-truncate-lines))

;; (use-package tree-sitter
;;   :defer t
;;   :hook
;;   (php-mode . tree-sitter-hl-mode)
;;   (typescript-mode . tree-sitter-hl-mode)
;;   (java-mode . tree-sitter-hl-mode))
;; 
;; (use-package tree-sitter-langs
;;   :after tree-sitter
;;   :defer t)

(use-package vterm :defer t)

(defun my/dap ()
  "Launch dap mode"
  (interactive)
  (dap-mode 1)
  (require 'dap-node)
  (dap-node-setup)
  (dap-ui-mode 1)
  (dap-tooltip-mode 1)
  (tooltip-mode 1)
  (dap-ui-controls-mode 1)
  (dap-ui-many-windows-mode 1))

(use-package dap-mode
  :defer t
  :bind
  ("C-c d d" . my/dap)
  (:map dap-mode-map
        ("C-c d s" . dap-debug)
        ("C-c d t" . dap-breakpoint-toggle)
        ("C-c d c" . dap-continue)
        ("C-c d n" . dap-next)
        ("C-c d i" . dap-step-in)
        ("C-c d o" . dap-step-out)
        ("C-c d q" . dap-disconnect)
        ("C-c d q" . dap-ui-locals)))
