(setq custom-file (concat user-emacs-directory "custom.el"))

(add-to-list 'default-frame-alist '(font . "JetBrainsMono Nerd Font-11"))
(set-frame-parameter (selected-frame) 'alpha '(95 90))
(add-to-list 'default-frame-alist '(alpha 95 90))

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

(if (display-graphic-p)
    (progn
      (tool-bar-mode 0)
      (scroll-bar-mode 0))
  (progn
    (load-theme 'modus-vivendi t)))

(menu-bar-mode 0)

;; ORG MODE
(setq org-startup-folded t)
(setq org-todo-keywords '((sequence "TODO" "IN PROGRESS" "QUESTION" "OPTIONAL" "|" "DONE" "ANSWERED")))
(setq org-todo-keyword-faces '(("QUESTION" . (:foreground "indianred"))
                               ("OPTIONAL" . (:foreground "tan"))
                               ("IN PROGRESS" . (:foreground "aqua"))))

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; get ready for emacs 29!
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
