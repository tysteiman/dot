(setq custom-file "~/.emacs.d/custom.el")
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; (set-frame-parameter (selected-frame) 'alpha '(90 . 50))
;; (add-to-list 'default-frame-alist '(alpha . (90 . 50)))

(set-face-attribute 'default nil :height 110)

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
(setq initial-scratch-message ";; scratch buffer\n\n")

(setq-default truncate-lines t)
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)
(setq-default js-indent-level 4)
(setq-default sgml-basic-offset 4)

(column-number-mode)

;; (global-display-line-numbers-mode t)

;; turn off line numbers for some things
(dolist (mode '(term-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda ()
                   (display-line-numbers-mode 0)
                   (turn-off-evil-mode))))

(add-hook 'prog-mode-hook (lambda () (setq show-trailing-whitespace t)))

;; DEFUNS
(defun my/open-initfile ()
  "Open my .emacs file"
  (interactive)
  (find-file (concat user-emacs-directory "init.el")))

(defun my/new-next-line ()
  "Create a new line under the current one"
  (interactive)
  (move-end-of-line 1)
  (newline)
  (indent-for-tab-command))

(defun my/project-tags (dir)
  "Generate etags for the current project (if in one). This will only generate tags for the app (rails) directory."
  (interactive "sCode dir to generate tags for: ")
  (let* ((project (projectile-project-root))
         (target-dir (concat project dir)))
    (if project
        (if (file-exists-p target-dir)
            (async-shell-command (concat "ctags -eR " target-dir))
          (message "Directory [%s] does not exist." dir))
      (message "Not in a project."))))

(defun my/rails-tags ()
  "Generate etags for rails projects (src)"
  (interactive)
  (my/project-tags "app"))

(defun my/dgg ()
  (interactive)
  (eww "https://duckduckgo.com"))

;; KEY BINDINGS
(global-set-key (kbd "C-c f d") 'my/open-initfile)
(global-set-key (kbd "C-c f i") 'imenu)
(global-set-key (kbd "C-c t r") 'my/rails-tags)
(global-set-key (kbd "C-c e s") 'eshell)
(global-set-key (kbd "C-o")     'my/new-next-line)

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
  :config (setq which-key-idle-delay 1))

(use-package counsel
  :bind (("M-x" . counsel-M-x)))

(use-package ivy-rich
  :init (ivy-rich-mode 1))

(use-package powerline
  ;; :config (powerline-default-theme)
  )

(use-package eshell-git-prompt
  :config (eshell-git-prompt-use-theme 'powerline))

(use-package airline-themes
  :config (load-theme 'airline-term t))

(use-package doom-modeline
  :init
  (setq doom-modeline-height 30)
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

(use-package rjsx-mode)

(use-package emmet-mode
  :bind (("C-j" . emmet-expand-line)))

(use-package slim-mode)

(set-cursor-color "indianred")

(toggle-frame-maximized)

;; random puts
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
