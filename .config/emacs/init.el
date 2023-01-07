;; --------------------------------------------------------------------
;;+ STARTUP
;; --------------------------------------------------------------------
(setq custom-file (concat user-emacs-directory "custom.el"))
(setq gc-cons-threshold (* 60 1000 1000))

;; --------------------------------------------------------------------
;;+ CONFIGURE EMACS
;; --------------------------------------------------------------------
(tool-bar-mode 0)
(scroll-bar-mode 0)
(menu-bar-mode 0)
(show-paren-mode)
(column-number-mode t)
(display-time-mode)
(auto-revert-mode t)
(fset 'yes-or-no-p 'y-or-n-p)

(setq make-backup-files nil)
(setq ns-pop-up-frames nil)
(setq vc-follow-symlinks t)
(setq tags-revert-without-query t)
(setq ruby-insert-encoding-magic-comment nil)
(setq inhibit-startup-message t)
(setq dired-listing-switches "-lah")
(setq initial-scratch-message ";; scratch buffer\n\n")
(setq create-lockfiles nil)
(setq message-log-max 100)
(setq visible-bell nil)
(setq ring-bell-function 'ignore)

(setq shr-use-colors nil
      shr-inhibit-images t
      shr-use-fonts nil)

(setq compilation-scroll-output t)

(setq-default truncate-lines t)
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)
(setq-default js-indent-level 4)
(setq-default sgml-basic-offset 4)

;; --------------------------------------------------------------------
;;+ FONT & SIZE
;; --------------------------------------------------------------------
(add-to-list 'default-frame-alist '(font . "JetBrainsMono Nerd Font-11"))
(set-frame-parameter (selected-frame) 'alpha '(90 90))
(add-to-list 'default-frame-alist '(alpha 90 90))

;; --------------------------------------------------------------------
;;+ DEFUNS
;; --------------------------------------------------------------------
(defun my/list-config ()
  "Open our init file and run occur on the sections"
  (interactive)
  (find-file "~/dot/.config/emacs/init.el")
  (occur ";;[+]"))

(defun my/send-region-to-shell (&optional start end)
  "Simple function to send the contents of a region to a shell command -- useful for debugging configs."
  (interactive)
  (let ((region-text (if (and start end)
                         (buffer-substring start end)
                       (buffer-substring (region-beginning) (region-end)))))
    (shell-command region-text)))

(defun my/send-line-to-shell ()
  "Function to use my/send-region-to-shell, giving it the whole line to run"
  (interactive)
  (my/send-region-to-shell (line-beginning-position) (line-end-position)))

;; (defun my/async-shell-command-on-file (command)
;;   "Send current file as the argument to `command' i.e. <`command'> <current-file>"
;;   (interactive "sAsync shell command on file: ")
;;   (let* ((file (expand-file-name (buffer-file-name)))
;;          (command-to-run (concat command " " file)))
;;     (async-shell-command command-to-run)))

(defun my/async-shell-command-docker (command)
  (interactive "sAsync Docker shell command: ")
  (let ((command-to-run (concat "docker-compose exec app " command)))
    (async-shell-command command-to-run)))

(defun my/configure-prog-mode ()
  "Configure prog mode buffer"
  (interactive)
  (setq show-trailing-whitespace t)
  (diff-hl-margin-mode 1)
  (diff-hl-mode 1)
  (hl-line-mode 1))

(defun my/sync-notes ()
  "Run AWS sync-notes binary for my notes directory"
  (interactive)
  (async-shell-command "sync-notes" (get-buffer-create "*notes*")))

(defun my/update-arch ()
  "Run async shell command to fetch for updates in yay"
  (interactive)
  (async-shell-command "yay -Syyu" (get-buffer-create "*yay*")))

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

;; --------------------------------------------------------------------
;;+ MODELINE
;; --------------------------------------------------------------------
(defun my/format-mode-line (left right)
  (let* ((available-width (- (window-width) (length left) 2)))
    (format (format " %%s %%%ds " available-width) left right)))

(setq-default mode-line-format
              '((:eval (my/format-mode-line
                        (format-mode-line "%b")
                        ;; (format-mode-line " %b : %l")
                        (format-mode-line (car (split-string display-time-string)))))))

;; (defun my/process-running-p (procname)
;;   "Helper to check system processes for PROCNAME (string).
;;
;; If PROCNAME is running, return t, otherwise nil."
;;   (let ((runningp nil))
;;     (dolist (pc (list-system-processes))
;;       (let* ((psattr (process-attributes pc))
;;              (psname (cdr (assoc 'comm psattr))))
;;         (when (string= psname procname)
;;           (setq runningp t))))
;;     runningp))

;; --------------------------------------------------------------------
;;+ SET & UNSET KEYS
;; --------------------------------------------------------------------
(global-unset-key (kbd "C-x C-c"))

(global-set-key (kbd "C-c s r") 'my/send-region-to-shell)
(global-set-key (kbd "C-c s l") 'my/send-line-to-shell)
(global-set-key (kbd "C-c s n") 'my/sync-notes)
(global-set-key (kbd "C-c s u") 'my/update-arch)
(global-set-key (kbd "C-c s d") 'my/async-shell-command-docker)
(global-set-key (kbd "C-c f c") 'my/list-config)
(global-set-key (kbd "C-c m l") 'my/git-blame-line)
(global-set-key (kbd "C-c m f") 'my/git-blame-file)
(global-set-key (kbd "C-c m r") 'my/git-blame-region)

;; other package commands
(global-set-key (kbd "C-c f i") 'imenu)
(global-set-key (kbd "C-c e s") 'eshell)
(global-set-key (kbd "M-z")     'zap-up-to-char)
(global-set-key (kbd "C-c i i") 'package-install)
(global-set-key (kbd "C-c i l") 'list-packages)
(global-set-key (kbd "C-c t l") 'display-line-numbers-mode)
(global-set-key (kbd "C-c t m") 'hide-mode-line-mode)
(global-set-key (kbd "C-c b r") 'rename-buffer)
(global-set-key (kbd "C-c b v") (lambda ()
                                  (interactive)
                                  (revert-buffer nil t)
                                  (message "Buffer reverted.")))

;; --------------------------------------------------------------------
;;+ HOOKS
;; --------------------------------------------------------------------
(add-hook 'prog-mode-hook 'my/configure-prog-mode)

(defvar my/dired-hide-details 1
  "Whether or not to show dired details")

;; dired hook
(add-hook 'dired-mode-hook (lambda ()
                             (interactive)
                             ;; launch hide details mode based on current value
                             (dired-hide-details-mode my/dired-hide-details)
                             ;; set keybinding to toggle that hide details value
                             (define-key dired-mode-map (kbd "C-c d d") (lambda ()
                                                                          (interactive)
                                                                          (let ((newval (if (eql my/dired-hide-details 0)
                                                                                            1
                                                                                          0)))
                                                                            (dired-hide-details-mode newval)
                                                                            (setq my/dired-hide-details newval))))))

;; --------------------------------------------------------------------
;;+ PACKAGES
;; --------------------------------------------------------------------
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

(defun my--evil-key-entry (key func)
  (evil-define-key nil evil-normal-state-map key func))

(defun my/set-evil-keys ()
  (my--evil-key-entry " f" 'projectile-find-file)
  (my--evil-key-entry " b" 'switch-to-buffer)
  (my--evil-key-entry " s" 'projectile-ripgrep)
  (my--evil-key-entry " g" 'magit-status)
  (my--evil-key-entry " l" 'eshell)
  (my--evil-key-entry " j" 'projectile-switch-project))

(use-package evil
  :config
  (setq evil-normal-state-cursor '("#7aa2f7" box))
  (setq evil-insert-state-cursor '("#73daca" (bar . 2)))
  (setq evil-visual-state-cursor '("#e0af68" box))
  (setq evil-emacs-state-cursor '("#bb9af7" box))
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
                        (my/set-evil-keys))))

(use-package evil-org
  :after org
  :hook (org-mode . evil-org-mode)
  :config (evil-org-set-key-theme '(navigation insert textobjects additional calendar)))

(use-package evil-escape
  :defer 1
  :after evil
  :init (setq-default evil-escape-key-sequence "jk")
  :config (evil-escape-mode))

(use-package magit
  :defer t
  :commands magit-status
  :bind (("C-c m s" . magit-status)
         ("C-M-i"   . magit-status)
         ("C-c m b" . magit-blame)))

(use-package diff-hl
  :after magit
  :hook (magit-post-refresh . diff-hl-magit-post-refresh))

(use-package vertico
  :defer 1
  :config (vertico-mode 1))

(use-package marginalia
  :after vertico
  :config (marginalia-mode)
  :init (setq marginalia-align 'right))

(use-package orderless
  :after vertico
  :init (setq completion-styles '(orderless)))

(use-package company
  :init (setq company-dabbrev-downcase nil)
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay nil)
  :hook
  (prog-mode . company-mode)
  (evil-after-load . (lambda ()
                       (evil-define-key nil evil-insert-state-map "\C-n" 'company-complete)))
  :bind (("C-M-c" . company-complete)))

(use-package smartparens
  :hook (prog-mode . smartparens-mode))

(use-package emmet-mode
  :defer t)

(use-package which-key
  :defer 1
  :config
  (which-key-mode)
  :diminish which-key-mode
  :init (setq which-key-idle-delay 0.5))

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")
  (setq lsp-headerline-breadcrumb-enable nil)
  :config
  (lsp-enable-which-key-integration t)
  :hook
  (c-mode    . lsp-deferred)
  (typescript-mode    . lsp-deferred)
  (js2-mode  . lsp-deferred)
  (rust-mode . lsp-deferred)
  (php-mode  . lsp-deferred)
  :hook (evil-after-load . (lambda ()
                             (my--evil-key-entry "K" 'lsp-ui-doc-glance))))

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode))

(use-package org
  :defer t
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

(defvar my/theme 'doom-one
  "Theme to use")

(use-package doom-themes
  :config
  (load-theme my/theme t)
  :hook (server-after-make-frame . (lambda ()
                                     (load-theme my/theme t))))

;; (use-package emacs
;;   :init
;;   (require-theme 'modus-themes)
;;   :config
;;   (load-theme 'modus-vivendi))

(use-package vterm
  :defer t
  :bind (("C-c e v" . my/vterm)
         ("C-c d u" . my/launch-docker-project)
         ("C-c d r" . my/launch-rails-docker-project)
         ("C-c d y" . my/launch-yarn-project)
         ("C-c d c" . my/launch-rails-console)
         ("C-c d a" . my/launch-rails-bash)))

(defun my/vterm (&optional bufname ignore-split)
  "Create a new VTERM buffer named `bufname'. Runs at projectile root when in a projectile directory."
  (interactive "sBuffer name: ")
  (let ((targetname (if (string-empty-p bufname) "vterm" bufname))
        (projectp (projectile-project-p)))
    ;; (unless ignore-split
    ;;   (split-window-right))
    (if projectp
        (projectile-run-vterm)
      (vterm))
    (rename-buffer (concat "*" targetname "*"))))

(defun my/launch-vterm-with-command (bufname command)
  "Launch vterm named `buffer-name' and run `command'."
  (my/vterm (my/project-vterm-name bufname) t)
  (vterm-send-string command)
  (vterm-send-return))

(defun my/project-vterm-name (typename)
  "Return target buffer name for project vterm buffer name e.g. foo-rails server"
  (concat (if (projectile-project-p)
              (projectile-project-name)
            (projectile-default-project-name default-directory))
          " " typename))

(defun my/launch-docker-project ()
  "Launch general docker project by running docker-compose up"
  (interactive)
  (split-window-right)
  (my/launch-vterm-with-command "up" "docker-compose up"))

(defun my/launch-rails-docker-project ()
  "Launch rails docker project by launching docker-compose up and rails s inside of the app container"
  (interactive)
  (my/launch-docker-project)
  (sit-for 5)
  (split-window-below)
  (my/launch-vterm-with-command "server" "docker-compose exec app rails s -b 0.0.0.0"))

(defun my/launch-rails-console ()
  "Launch a rails console in vterm"
  (interactive)
  (split-window-right)
  (my/launch-vterm-with-command "console" "docker-compose exec app rails c"))

(defun my/launch-rails-bash ()
  "Launch a bash session in a rails container"
  (interactive)
  (split-window-right)
  (my/launch-vterm-with-command "app" "docker-compose exec app bash"))

(defun my/launch-yarn-project ()
  "Launch yarn project by launching yarn start"
  (interactive)
  (split-window-right)
  (my/launch-vterm-with-command "yarn" "yarn start"))

(use-package rainbow-delimiters
  :defer t
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package rainbow-mode
  :defer t)

(use-package hl-todo
  :hook (prog-mode . hl-todo-mode))

(use-package all-the-icons
  :defer t)

(use-package doom-modeline
  :init
  (setq doom-modeline-height 30
        doom-modeline-bar-width 5
        doom-modeline-vcs-max-length 25
        doom-modeline-buffer-file-name-style "file-name")
  :config
  (doom-modeline-mode 1)
  ;; (set-face-attribute 'doom-modeline-time nil :foreground "#e0af68")
  ;; (set-face-attribute 'doom-modeline-evil-normal-state nil :background "#7aa2f7" :foreground "black")
  ;; (set-face-attribute 'doom-modeline-evil-insert-state nil :background "#73daca" :foreground "black")
  ;; (set-face-attribute 'doom-modeline-evil-visual-state nil :background "#e0af68" :foreground "black")
  ;; (set-face-attribute 'doom-modeline-evil-emacs-state nil :background "#bb9af7" :foreground "black")
  )

(use-package solaire-mode
  :defer 1
  :init (solaire-global-mode +1))

(use-package diredfl
  :defer t
  :hook (dired-mode . diredfl-mode))

(use-package helpful
  :defer t
  :bind (("C-h f" . helpful-function)
         ("C-h v" . helpful-variable)
         ("C-h k" . helpful-key)))

(use-package ibuffer
  :bind (("C-x C-b" . ibuffer))
  :config
  (define-key ibuffer-mode-map (kbd "C-x C-b") 'previous-buffer))

(use-package winner
  :defer 1
  :config (winner-mode))

;; (use-package window-numbering
;;   :defer 1
;;   :config (window-numbering-mode 1))

(use-package projectile
  :defer 1
  :config
  (projectile-mode 1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package swiper
  :bind (("C-M-s" . swiper))
  :hook (evil-after-load . (lambda ()
                             (my--evil-key-entry "/" 'swiper))))

(use-package rg
  :commands (projectile-ripgrep))

(use-package windmove
  :defer 1
  :config
  (windmove-default-keybindings)
  (windmove-mode 1))

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

(use-package typescript-mode
  :defer t)

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

(use-package rust-mode
  :defer t)

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

(use-package tree-sitter
  :defer t
  :hook
  (ruby-mode . tree-sitter-hl-mode)
  (typescript-mode . tree-sitter-hl-mode)
  (java-mode . tree-sitter-hl-mode)
  (css-mode  . tree-sitter-hl-mode)
  (rust-mode . tree-sitter-hl-mode)
  (c-mode    . tree-sitter-hl-mode)
  (sh-mode   . tree-sitter-hl-mode)
  (yaml-mode . tree-sitter-hl-mode)
  (php-mode  . tree-sitter-hl-mode))

(use-package tree-sitter-langs
  :after tree-sitter
  :defer t)

(use-package sudo-edit
  :defer t)

(use-package restart-emacs
  :defer t)

(use-package hide-mode-line
  :hook
  (vterm-mode . hide-mode-line-mode)
  (eshell-mode . hide-mode-line-mode))

(use-package consult
  :defer t)

(load-file (concat user-emacs-directory "exwm.el"))

;; --------------------------------------------------------------------
;;+ PUTS
;; --------------------------------------------------------------------
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'erase-buffer 'disabled nil)

;; --------------------------------------------------------------------
;;+ PERFORMANCE & GC
;; --------------------------------------------------------------------
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb
