;; --------------------------------------------------------------------
;;+ STARTUP
;; --------------------------------------------------------------------
(setq custom-file (concat user-emacs-directory "custom.el"))
(setq gc-cons-threshold (* 60 1000 1000))

;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;; eval below to find all sections!
;; TODO make a defun to jump to this buffer and run this occur!
;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;; (occur ";;[+]")
;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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
(set-frame-parameter (selected-frame) 'alpha '(90 85))
(add-to-list 'default-frame-alist '(alpha 90 85))

;; --------------------------------------------------------------------
;;+ DEFUNS
;; --------------------------------------------------------------------
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

(defun my/async-shell-command-rubocop ()
  (interactive)
  (my/async-shell-command-on-file "rubocop"))

(defun my/async-shell-command-docker (command)
  (interactive "sAsync Docker shell command: ")
  (let ((command-to-run (concat "docker-compose exec app " command)))
    (async-shell-command command-to-run)))

(defun my/configure-prog-mode ()
  "Configure prog mode buffer"
  (interactive)
  (setq show-trailing-whitespace t)
  ;; (display-line-numbers-mode 1)
  (diff-hl-margin-mode 1)
  (diff-hl-mode 1)
  (rainbow-mode)
  (hl-line-mode 1))

(defun my/quit-emacs (yn)
  "Prompt the user if they're sure before closing Emacs."
  (interactive "cAre you sure you want to close Emacs? (y/n): ")
  (when (char-equal yn ?y)
    (save-buffers-kill-terminal)))

(defun my/sync-notes ()
  "Run AWS sync-notes binary for my notes directory"
  (interactive)
  (async-shell-command "sync-notes" (get-buffer-create "*notes*")))

(defun my/update-arch ()
  "Run async shell command to fetch for updates in yay"
  (interactive)
  (async-shell-command "yay -Syyu" (get-buffer-create "*yay*")))

(defun my/find-file-emacs (file)
  "Find file in user emacs directory matching `file'.el"
  (find-file (concat user-emacs-directory file ".el")))

(defun my/reset-dunst ()
  "Kill dunst and fire a test message using notify-send"
  (interactive)
  (shell-command "killall -q dunst && notify-send hello dunst"))

(defun my/process-running-p (procname)
  "Helper to check system processes for PROCNAME (string).

If PROCNAME is running, return t, otherwise nil."
  (let ((runningp nil))
    (dolist (pc (list-system-processes))
      (let* ((psattr (process-attributes pc))
             (psname (cdr (assoc 'comm psattr))))
        (when (string= psname procname)
          (setq runningp t))))
    runningp))

;; --------------------------------------------------------------------
;;+ BIND KEYS
;; --------------------------------------------------------------------
(global-set-key (kbd "C-c t r") 'my/rails-tags)
(global-set-key (kbd "C-x C-c") 'my/quit-emacs)
(global-set-key (kbd "C-o")     'my/new-next-line)
(global-set-key (kbd "C-M-o")   'my/new-previous-line)
(global-set-key (kbd "C-c s r") 'my/send-region-to-shell)
(global-set-key (kbd "C-c s l") 'my/send-line-to-shell)
(global-set-key (kbd "C-c s n") 'my/sync-notes)
(global-set-key (kbd "C-c s u") 'my/update-arch)
(global-set-key (kbd "C-c s d") 'my/async-shell-command-docker)

;; other package commands
(global-set-key (kbd "C-c f i") 'imenu)
(global-set-key (kbd "C-c e s") 'eshell)
(global-set-key (kbd "M-z")     'zap-up-to-char)
(global-set-key (kbd "C-c i i") 'package-install)
(global-set-key (kbd "C-c i l") 'list-packages)
(global-set-key (kbd "C-c t l") 'display-line-numbers-mode)
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

(use-package vertico
  :config (vertico-mode 1))

(use-package vertico-posframe
  :defer t
  :init
  (setq vertico-posframe-width 100)
  (setq vertico-posframe-parameters '((left-fringe . 10)
                                      (right-fringe . 20)))
  :hook (server-after-make-frame . (lambda ()
                                     (vertico-posframe-mode 1)
                                     (posframe-delete-all))))

(use-package marginalia
  :after vertico
  :config (marginalia-mode)
  :init (setq marginalia-align 'right))

(use-package orderless
  :init (setq completion-styles '(orderless)))

(use-package company
  :init (setq company-dabbrev-downcase nil)
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.5)
  :hook (prog-mode . company-mode)
  :bind (("C-M-c" . company-complete)))

(use-package company-box
  :hook (company-mode . company-box-mode))

(use-package smartparens
  :hook (prog-mode . smartparens-mode))

(use-package emmet-mode
  :defer t)

(use-package which-key
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
  (js2-mode  . lsp-deferred)
  (rust-mode . lsp-deferred)
  (php-mode  . lsp-deferred))

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode))

(use-package lsp-treemacs
  :after lsp)

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

(defun my/flyspell ()
  "Turn on flyspell mode for the whole buffer"
  (flyspell-mode 1)
  (flyspell-buffer))

(use-package flyspell
  :hook (org-mode . my/flyspell))

(defvar my/theme 'doom-wilmersdorf
  "Theme to use")

(defvar my/term-theme 'doom-tokyo-night
  "Terminal theme to use")

(use-package doom-themes
  :init
  (setq doom-themes-treemacs-theme "doom-colors")
  ;; :config (load-theme my/theme t)
  :config (when
              (and
               (not (daemonp))
               (not (display-graphic-p)))
            (load-theme my/term-theme t))
  :hook (server-after-make-frame . (lambda ()
                                     (load-theme my/theme t))))

(use-package vterm
  :init (setq vterm-shell "/usr/bin/fish")
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
    (unless ignore-split
      (split-window-right))
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

(use-package doom-modeline
  :init
  (setq doom-modeline-height 50)
  (setq doom-modeline-bar-width 5)
  (setq doom-modeline-vcs-max-length 25)
  (setq doom-modeline-buffer-file-name-style "file-name")
  :config (doom-modeline-mode 1))

(use-package solaire-mode
  :init (solaire-global-mode +1))

(use-package dimmer
  :config (setq dimmer-fraction 0.4)
  :init (dimmer-mode t))

(use-package diredfl
  :hook (dired-mode . diredfl-mode))

(use-package helpful
  :bind (("C-h f" . helpful-function)
         ("C-h v" . helpful-variable)
         ("C-h k" . helpful-key)))

(use-package ibuffer
  :bind (("C-x C-b" . ibuffer))
  :config
  (define-key ibuffer-mode-map (kbd "C-x C-b") 'previous-buffer))

(use-package winner
  :config (winner-mode))

(use-package window-numbering
  :config (window-numbering-mode 1))

(use-package projectile
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
  :config
  (windmove-default-keybindings)
  (windmove-mode 1))

;; (use-package multiple-cursors
;;   :bind (("C->"     . mc/mark-next-like-this)
;;          ("C-<"     . mc/mark-previous-like-this)
;;          ("C-c C->" . mc/mark-all-like-this)
;;          ("C-c m l" . mc/edit-lines)))

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

(use-package all-the-icons :defer t)

(use-package all-the-icons-dired
  :after all-the-icons
  :init (setq all-the-icons-dired-monochrome nil)
  :hook (dired-mode . all-the-icons-dired-mode))

(use-package all-the-icons-ibuffer
  :after all-the-icons
  :hook (ibuffer-mode . all-the-icons-ibuffer-mode))

(use-package centaur-tabs
  :defer t
  :init
  (setq centaur-tabs-style "bar")
  (setq centaur-tabs-height 32)
  (setq centaur-tabs-set-icons t)
  (setq centaur-tabs-gray-out-icons 'buffer)
  (setq centaur-tabs-set-bar 'left)
  :bind
  ("C-<left>" . centaur-tabs-backward-tab)
  ("C-<right>" . centaur-tabs-forward-tab)
  ("C-<up>" . centaur-tabs-switch-group)
  :hook
  (server-after-make-frame . (lambda()
                               (centaur-tabs-mode t))))

(use-package pulseaudio-control
  :config (pulseaudio-control-default-keybindings))

(use-package sudo-edit
  :defer t)

(use-package dictionary
  :defer t)

(use-package restart-emacs
  :defer t)

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
