(setq custom-file (concat user-emacs-directory "custom.el"))

;; set some variables
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
      org-startup-folded t
      remote-file-name-inhibit-cache nil
      tramp-verbose 0
      vc-ignore-dir-regexp
      (format "\\(%s\\)\\|\\(%s\\)"
              vc-ignore-dir-regexp
              tramp-file-name-regexp))

(setq-default truncate-lines t
              indent-tabs-mode nil)

;; only stuff built into emacs!
(column-number-mode)
(display-time-mode)
(windmove-default-keybindings)
(winner-mode)

(if (or (display-graphic-p) (daemonp))
    (progn
      (tool-bar-mode 0)
      (scroll-bar-mode 0)
      (add-to-list 'default-frame-alist '(font . "JetBrainsMono Nerd Font-11"))
      (set-frame-parameter (selected-frame) 'alpha '(95 90))
      (add-to-list 'default-frame-alist '(alpha 95 90)))
  (progn
    (load-theme 'modus-vivendi t)))

(menu-bar-mode 0)

(defface extra-whitespace-face
  '((t (:background "pale green")))
  "Highlight rule used for tabs and special chars we want to see.")

(defvar my-extra-keywords
  '(("\t" . 'extra-whitespace-face))
  "Define keywords that are counted as extra and will be highlighted with `extra-whitespace-face'.")

;; configure prog mode
(add-hook 'prog-mode-hook (lambda ()
                            (setq show-trailing-whitespace t)
                            (font-lock-add-keywords nil my-extra-keywords)))

(add-hook 'org-mode-hook (lambda ()
                           (setq truncate-lines nil)))

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

(use-package magit)
(use-package vterm)

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '(php-mode . ("intelephense" "--stdio"))))

(global-set-key (kbd "C-x C-b") 'ibuffer) ;; use ibuffer instead of default

;; write some defuns
(defun open-config ()
  "Open Emacs init.el"
  (interactive)
  (find-file (concat user-emacs-directory "init.el")))

(defun work ()
  "Connect to work via TRAMP"
  (interactive)
  (dired "/ssh:work:/home/admin"))
(put 'narrow-to-region 'disabled nil)

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

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
