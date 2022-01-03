(setq custom-file (concat user-emacs-directory "custom.el"))

(set-face-attribute 'default nil :height 110)

(set-frame-parameter (selected-frame) 'alpha '(90 . 60))
(add-to-list 'default-frame-alist '(alpha . (90 . 60)))

(tool-bar-mode 0)
(menu-bar-mode 0)
(column-number-mode t)
(scroll-bar-mode 0)
(show-paren-mode)
(display-time-mode)
(auto-revert-mode t)
(fringe-mode 5)

(setq make-backup-files nil)
(setq ns-pop-up-frames nil)
(setq vc-follow-symlinks t)
(setq tags-revert-without-query t)
(setq ruby-insert-encoding-magic-comment nil)
(setq inhibit-startup-message t)
(setq dired-listing-switches "-lah")
(setq initial-scratch-message ";; scratch buffer\n\n")
(setq browse-url-firefox-program "chromium")
(setq create-lockfiles nil)

(setq-default truncate-lines t)
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)
(setq-default js-indent-level 4)
(setq-default sgml-basic-offset 4)

(column-number-mode t)

(add-hook 'term-exec-hook (function
                           (lambda ()
                             (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))))

(add-hook 'prog-mode-hook (lambda ()
                            (setq show-trailing-whitespace t)
                            (hl-line-mode 1)))

(add-hook 'org-mode-hook (lambda ()
                           (toggle-truncate-lines)))

;; DEFUNS
(defun my/open-config-file (file)
  (interactive "sWhich config file (name) do you want to open?")
  (find-file (concat user-emacs-directory file ".el")))

(defun my/open-initfile ()
  "Open my .emacs file"
  (interactive)
  (my/open-config-file "init"))

(defun my/open-packages ()
  "Open my packages file"
  (interactive)
  (my/open-config-file "packages"))

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

(defun my/project-tags (dir)
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
              (async-shell-command (concat "ctags --exclude=*css --exclude=*scss --exclude=*.erb -eR -f " tags-file " " target-dir))
              ;; TODO: might not need to do this -- i was generating the tags in the wrong dir previously
              (visit-tags-table tags-file))
          (message "Directory [%s] does not exist." dir))
      (message "Not in a project."))))

(defun my/rails-tags ()
  "Generate etags for rails projects (src)"
  (interactive)
  (my/project-tags "app"))

(defun my/quit-emacs (yn)
  "Prompt the user if they're sure before closing Emacs."
  (interactive "cAre you sure you want to close Emacs? y/n ): ")
  (when (char-equal yn ?y)
    ;; (start-process-shell-command "xrandr" nil "xrandr --output eDP-1 --mode 1920x1080 --brightness .8")
    (save-buffers-kill-terminal)))

(defun my/load-config-file (file)
  "Load configuration .el file"
  (let ((full-path (concat user-emacs-directory file ".el")))
    (if (file-exists-p full-path)
        (load-file full-path)
      (message "File [%s] does not exist." full-path))))

;; (defun my/toggle-evil ()
;;   "Turn evil mode on and off"
;;   (interactive)
;;   (if evil-state
;;       (turn-off-evil-mode)
;;     (turn-on-evil-mode)))

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

;; KEY BINDINGS
(global-set-key (kbd "C-c f d") 'my/open-initfile)
(global-set-key (kbd "C-c f p") 'my/open-packages)
(global-set-key (kbd "C-c f i") 'imenu)
(global-set-key (kbd "C-c t r") 'my/rails-tags)
(global-set-key (kbd "C-c e s") 'eshell)
(global-set-key (kbd "C-x C-c") 'my/quit-emacs)
(global-set-key (kbd "C-o")     'my/new-next-line)
(global-set-key (kbd "C-M-o")   'my/new-previous-line)
(global-set-key (kbd "M-z")     'zap-up-to-char)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-M-\\")  'split-window-right)
(global-set-key (kbd "C-M--")   'split-window-below)
(global-set-key (kbd "C-M-0")   'delete-window)
(global-set-key (kbd "C-M-1")   'delete-other-windows)
(global-set-key (kbd "C-c s r") 'my/send-region-to-shell)
(global-set-key (kbd "C-c s l") 'my/send-line-to-shell)

;; LOAD PACKAGES
(my/load-config-file "packages")

(set-cursor-color "indianred")
;; (set-cursor-color "#8ec07c")

;; random puts
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
