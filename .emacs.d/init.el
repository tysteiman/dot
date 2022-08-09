(setq custom-file (concat user-emacs-directory "custom.el"))

(setq gc-cons-threshold (* 60 1000 1000))

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode t)
(show-paren-mode)
(display-time-mode)
(auto-revert-mode t)
(toggle-frame-maximized)

(setq make-backup-files nil)
(setq ns-pop-up-frames nil)
(setq vc-follow-symlinks t)
(setq tags-revert-without-query t)
(setq ruby-insert-encoding-magic-comment nil)
(setq inhibit-startup-message t)
(setq dired-listing-switches "-lah")
(setq initial-scratch-message ";; scratch buffer\n\n")
(setq create-lockfiles nil)

(setq-default truncate-lines t)
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)
(setq-default js-indent-level 4)
(setq-default sgml-basic-offset 4)

;; (set-face-attribute 'default nil :height 120 :family "JetBrainsMono Nerd Font")
(add-to-list 'default-frame-alist '(font . "JetBrainsMono Nerd Font-12"))
(set-frame-parameter (selected-frame) 'alpha '(90 70))
(add-to-list 'default-frame-alist '(alpha 90 70))

(defun my/trim-current-line-region ()
  "Trim whitespace for the given line"
  (let ((end (point))
        (beg (save-excursion
               (move-beginning-of-line 1)
               (point))))
    (whitespace-cleanup-region beg end)))

(defun my/new-next-line ()
  "Create a new line under the current one"
  (interactive)
  (move-end-of-line 1)
  (my/trim-current-line-region)
  (newline)
  (indent-for-tab-command))

(defun my/new-previous-line ()
  "Create a new line above the current one"
  (interactive)
  (my/trim-current-line-region)
  (move-beginning-of-line 1)
  (newline)
  (previous-line)
  (indent-for-tab-command))

(defun my/project-tags (dir &optional excludes)
  "Generate etags for the current project (if in one). This will only generate tags for the app (rails) directory."
  (interactive "sCode dir to generate tags for: ")
  (let* ((project (projectile-project-root))
         (target-dir (concat project dir))
         (tags-file (concat project "TAGS")))
    (if project
        (if (file-exists-p target-dir)
            ;; are never that big...
            (progn
              ;; it may be possible that this command is not finished by the time we reun visit-tags-table....
              ;; if we ever notice that we could probably just switch this to being a sync exec since our files
              (async-shell-command (concat "ctags " (or excludes "") " -eR -f " tags-file " " target-dir))
              ;; TODO: might not need to do this -- i was generating the tags in the wrong dir previously
              (visit-tags-table tags-file))
          (message "Directory [%s] does not exist." dir))
      (message "Not in a project."))))

(defun my/rails-tags ()
  "Generate etags for rails projects (src)"
  (interactive)
  (my/project-tags "app" "--exclude=*css --exclude=*scss --exclude=*.erb"))

(defun my/react-tags ()
  "Generate ctags for React (create-react-app) projects"
  (interactive)
  (my/project-tags "src"))

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

(defun my/async-shell-command-on-file (command)
  "Send current file as the argument to `command' i.e. <`command'> <current-file>"
  (interactive "sAsync shell command on file: ")
  (let* ((file (expand-file-name (buffer-file-name)))
         (command-to-run (concat command " " file)))
    (async-shell-command command-to-run)))

(defun my/async-shell-command-docker (command)
  (interactive "sAsync Docker shell command: ")
  (let ((command-to-run (concat "docker-compose exec app " command)))
    (async-shell-command command-to-run)))

(defun my/async-shell-command-rubocop ()
  (interactive)
  (my/async-shell-command-on-file "rubocop"))

(eval-after-load 'ruby-mode '(progn
                               (define-key ruby-mode-map (kbd "C-c r r") 'my/async-shell-command-rubocop)))

(defun my/projectile-ripgrep ()
  (interactive)
  (if (region-active-p)
      (my/projectile-ripgrep-region)
    (my/projectile-ripgrep-thing-at-point)))

(defun my/projectile-ripgrep-region ()
  (interactive)
  (let ((grabbed (buffer-substring-no-properties (region-beginning) (region-end))))
    (projectile-ripgrep grabbed)))

(defun my/projectile-ripgrep-thing-at-point ()
  (interactive)
  (projectile-ripgrep (thing-at-point 'word t)))

(defun my/load-config-file (file)
  "Load configuration .el file"
  (let ((full-path (concat user-emacs-directory file ".el")))
    (if (file-exists-p full-path)
        (load-file full-path)
      (message "File [%s] does not exist." full-path))))

(defun my/configure-prog-mode ()
  (interactive)
  (setq show-trailing-whitespace t)
  (display-line-numbers-mode 1)
  (diff-hl-margin-mode 1)
  (diff-hl-mode 1)
  (rainbow-mode)
  (when (display-graphic-p)
    (hl-line-mode 1)))

(defun my/quit-emacs (yn)
  "Prompt the user if they're sure before closing Emacs."
  (interactive "cAre you sure you want to close Emacs? (y/n): ")
  (when (char-equal yn ?y)
    (save-buffers-kill-terminal)))

(defun my/sync-notes ()
  "Run AWS sync-notes binary for my notes directory"
  (interactive)
  (async-shell-command "sync-notes"))

(defun my/open-notes ()
  (interactive)
  (dired "~/notes"))

(defun my/laptop-on ()
  (interactive)
  (shell-command "xrandr --output eDP-1 --mode 1920x1080 --brightness 1 --output HDMI-1-0 --mode 2560x1440 --primary --right-of eDP-1"))

(defun my/laptop-off ()
  (interactive)
  (shell-command "xrandr --output eDP-1 --mode 1920x1080 --brightness 0 --output HDMI-1-0 --mode 2560x1440 --primary --right-of eDP-1"))

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
  :hook (conf-mode . my/configure-prog-mode))

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

(use-package emmet-mode
  :defer t)

(use-package web-mode
  :mode "\\.erb\\'"
  :mode "\\.php\\'"
  :mode "\\.html\\'"
  :config
  (define-key web-mode-map (kbd "C-j") 'emmet-expand-line))

(use-package markdown-mode
  :defer t)

(use-package slim-mode
  :defer t)

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")
  (setq lsp-headerline-breadcrumb-enable nil)
  :config
  (lsp-enable-which-key-integration t)
  ;; :hook
  ;; (rjsx-mode . lsp-deferred)
  )

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode))

(use-package company
  :init (setq company-dabbrev-downcase nil)
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.5)
  :hook (prog-mode . company-mode))

(use-package company-box
  :hook (company-mode . company-box-mode))

(use-package prettier
  :after (:any js2-mode rjsx-mode)
  :hook
  (js2-mode  . my/configure-prettier)
  (rjsx-mode . my/configure-prettier))

(defun my/configure-prettier ()
  "Configure Prettier by turning it on only if there is a pretterrc file in the projectile root"
  (let ((prettier-rc (concat (projectile-project-root) ".prettierrc.json")))
    (if (file-exists-p prettier-rc)
        (prettier-mode 1)
      (message ".prettierrc.json not detected in project root -- skipped loading."))))

(use-package tree-sitter
  :hook (ruby-mode . tree-sitter-hl-mode))

(use-package tree-sitter-langs :defer t)

(defvar my/theme 'doom-palenight)

(use-package doom-themes
  :config (load-theme my/theme t)
  :hook (server-after-make-frame . (lambda ()
                                     (load-theme my/theme t))))

(use-package doom-modeline
  :init
  (setq doom-modeline-height 50)
  (setq doom-modeline-bar-width 5)
  (setq doom-modeline-vcs-max-length 25)
  (setq doom-modeline-buffer-file-name-style "file-name")
  :config (doom-modeline-mode 1))

(use-package solaire-mode
  :config (solaire-global-mode +1))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package swiper
  :bind (("C-M-s" . swiper)))

(use-package window-numbering
  :config (window-numbering-mode 1))

(use-package which-key
  :config
  (which-key-mode)
  :diminish which-key-mode
  :init (setq which-key-idle-delay 1))

(use-package diredfl
  :hook (dired-mode . diredfl-mode))

(use-package tab-bar
  :defer
  :init
  (setq tab-bar-show 1)
  (setq tab-bar-close-button-show nil)
  :custom-face
  (tab-bar-tab ((t (:inherit 'doom-modeline-panel :background nil :foreground nil))))
  (tab-bar-tab-inactive ((t (:inherit 'doom-modeline-highlight :background nil :foreground nil)))))

(use-package dashboard
  :init
  ;; (setq dashboard-startup-banner 'logo)
  (setq dashboard-startup-banner (if (display-graphic-p) 'logo (concat user-emacs-directory "banner.txt")))
  (setq dashboard-set-heading-icons t)

  (setq initial-buffer-choice (lambda ()
                                (get-buffer "*dashboard*")))

  (setq dashboard-items '((recents . 20)
                          (projects . 20)))

  :config
  (dashboard-setup-startup-hook)
  (dashboard-modify-heading-icons '((projects . "repo")
                                    (recents  . "squirrel")))
  (global-set-key (kbd "C-c f d") (lambda ()
                                    (interactive)
                                    (switch-to-buffer "*dashboard*"))))

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
  (csv-mode         . turn-on-evil-mode))

(use-package evil-org
  :after org
  :hook (org-mode . evil-org-mode)
  :config (evil-org-set-key-theme '(navigation insert textobjects additional claendar)))

(use-package evil-escape
  :after evil
  :init (setq-default evil-escape-key-sequence "jk")
  :config (evil-escape-mode))

(use-package magit
  :commands magit-status
  :bind (("C-c m s" . magit-status)
         ("C-M-i"   . magit-status)
         ("C-c m b" . magit-blame)))

(use-package diff-hl
  :after magit
  :hook (magit-post-refresh . diff-hl-magit-post-refresh))

(use-package projectile
  :config
  (projectile-mode 1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  :bind (("C-c s s" . my/projectile-ripgrep)))

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
  :bind (("C-c t i" . org-timer-set-timer))
  :hook (org-mode . org-indent-mode))

(use-package sudo-edit
  :defer t)

(use-package rg
  :commands (projectile-ripgrep))

(use-package ibuffer
  :bind (("C-x C-b" . ibuffer))
  :config
  (define-key ibuffer-mode-map (kbd "C-x C-b") 'previous-buffer)
  (define-key ibuffer-mode-map (kbd "q")       'kill-buffer-and-window))

(use-package eshell-info-banner
  :defer t
  :hook (eshell-banner-load . eshell-info-banner-update-banner))

(use-package eshell-git-prompt
  :config (eshell-git-prompt-use-theme 'multiline2))

(defun my/vterm (&optional bufname)
  "Create a new VTERM buffer named `'bufname. Runs at projectile root when in a projectile directory."
  (interactive "sBuffer name: ")
  (message "Buffer name: %s" bufname)
  (let ((targetname (if (string-empty-p bufname) "vterm" bufname))
        (projectp (projectile-project-p)))
    (split-window-sensibly)
    (if projectp
        (projectile-run-vterm)
      (vterm))
    (rename-buffer (concat "*" targetname "*"))))

(use-package vterm
  :bind (("C-c e v" . my/vterm)))

(use-package pulseaudio-control
  :config (pulseaudio-control-default-keybindings))

(use-package dictionary
  :defer t)

(use-package all-the-icons)

(use-package all-the-icons-dired
  :after all-the-icons
  :init (setq all-the-icons-dired-monochrome nil)
  :hook (dired-mode . all-the-icons-dired-mode))

(use-package all-the-icons-ibuffer
  :after all-the-icons
  :hook (ibuffer-mode . all-the-icons-ibuffer-mode))

(use-package vertico
  :config (vertico-mode 1))

;; (use-package vertico-posframe
;;   :after vertico
;;   :init (setq vertico-posframe-width 100)
;;   :config (vertico-posframe-mode 1)
;;   :hook (server-after-make-frame . vertico-posframe-cleanup))

(use-package marginalia
  :after vertico
  :init (marginalia-mode))

(use-package orderless
  :init (setq completion-styles '(orderless)))

(defun my/flyspell ()
  "Turn on flyspell mode for the whole buffer"
  (flyspell-mode 1)
  (flyspell-buffer))

(use-package flyspell
  :hook (org-mode . my/flyspell))

(use-package hl-todo
  :hook (prog-mode . hl-todo-mode))

(use-package rainbow-mode
  :defer t)

(use-package csv-mode
  :defer t
  :hook (csv-mode . csv-align-mode))

(use-package json-mode
  :defer t)

(use-package helpful
  :bind (("C-h f" . helpful-function)
         ("C-h v" . helpful-variable)
         ("C-h k" . helpful-key)))

(global-set-key (kbd "C-c t r") 'my/rails-tags)
(global-set-key (kbd "C-x C-c") 'my/quit-emacs)
(global-set-key (kbd "C-o")     'my/new-next-line)
(global-set-key (kbd "C-M-o")   'my/new-previous-line)
(global-set-key (kbd "C-c s r") 'my/send-region-to-shell)
(global-set-key (kbd "C-c s l") 'my/send-line-to-shell)
(global-set-key (kbd "C-c s n") 'my/sync-notes)
(global-set-key (kbd "C-c r d") 'my/async-shell-command-docker)

(global-set-key (kbd "C-c f o") (lambda ()
                                  (interactive)
                                  (find-file (concat user-emacs-directory "init.el"))))

(global-set-key (kbd "C-c f n") 'my/open-notes)

(global-set-key (kbd "C-c f i") 'imenu)
(global-set-key (kbd "C-c e s") 'eshell)
(global-set-key (kbd "M-z")     'zap-up-to-char)
(global-set-key (kbd "C-M-\\")  'split-window-right)
(global-set-key (kbd "C-M--")   'split-window-below)
(global-set-key (kbd "C-M-0")   'delete-window)
(global-set-key (kbd "C-M-1")   'delete-other-windows)
(global-set-key (kbd "C-M-=")   'balance-windows)
(global-set-key (kbd "C-c i i") 'package-install)
(global-set-key (kbd "C-c i l") 'list-packages)
(global-set-key (kbd "C-c t l") 'display-line-numbers-mode)
(global-set-key (kbd "C-c b r") 'rename-buffer)

(global-set-key (kbd "C-c b v") (lambda ()
                                  (interactive)
                                  (revert-buffer nil t)
                                  (message "Buffer reverted.")))

(add-hook 'prog-mode-hook 'my/configure-prog-mode)

(add-hook 'org-mode-hook (lambda ()
                           (toggle-truncate-lines)))

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'erase-buffer 'disabled nil)

(setq gc-cons-threshold 100000000)

(setq read-process-output-max (* 1024 1024)) ;; 1mb
