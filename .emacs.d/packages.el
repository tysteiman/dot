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
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  :bind
  (("C-M-f" . projectile-find-file)))

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

;; (use-package gruvbox-theme
  ;; :config (load-theme 'gruvbox-dark-hard t))

(use-package doom-themes
  :config
  (load-theme 'doom-one t))

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
  :config (eshell-git-prompt-use-theme 'multiline))

(use-package all-the-icons)

(use-package doom-modeline
  :init
  (setq doom-modeline-height 40)
  (setq doom-modeline-vcs-max-length 25)
  (setq doom-modeline-buffer-file-name-style "file-name")
  :config
  (doom-modeline-mode 1))

(use-package evil
  :bind (("C-c e e" . my/toggle-evil))
  :init (evil-mode 0))

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

(use-package sudo-edit)

(use-package rg)

(use-package diff-hl
  :after magit
  :config
  (global-diff-hl-mode)
  (diff-hl-margin-mode)
  :hook
  (magit-post-refresh . diff-hl-magit-post-refresh))

(use-package org)

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode))

(use-package ibuffer
  :config
  (define-key ibuffer-mode-map (kbd "C-x C-b") 'previous-buffer))

(use-package exwm
  :config
  (setq exwm-input-prefix-keys '(
                                 ?\C-x
                                 ?\C-u
                                 ?\C-h
                                 ?\M-x
                                 ?\M-`
                                 ?\M-&
                                 ?\M-:
                                 ?\M-1
                                 ?\M-2
                                 ?\M-3
                                 ?\M-4
                                 ?\M-5
                                 ?\M-6
                                 ?\M-7
                                 ?\M-8
                                 ?\M-9
                                 ))
  (require 'exwm-randr)
  (setq exwm-randr-workspace-monitor-plist '(1 "HDMI-1-0"))
  (add-hook 'exwm-randr-screen-change-hook (lambda ()
                                             (start-process-shell-command "xrandr" nil "xrandr --output eDP-1 --mode 1920x1080 --brightness 0 --output HDMI-1-0 --mode 2560x1440 --primary --right-of eDP-1")
                                             (start-process-shell-command "feh" nil "feh --bg-scale ~/dot/wallpaper/dark-beach.jpg")))
  (exwm-randr-enable)
  (exwm-enable)
  :bind
  (("C-c k a" . exwm-workspace-add)
   ("C-c k s" . exwm-workspace-switch)
   ("C-c k x" . exwm-workspace-delete)))
