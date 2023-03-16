;;; CUSTOM FILE
(setq custom-file (concat user-emacs-directory "custom.el"))

;;; APPEARANCE
(set-face-attribute 'default nil :height 130 :family "agave Nerd Font")

;; swap mode line with header line
(let ((format mode-line-format))
  (setq-default header-line-format format)
  (setq-default mode-line-format nil))

;; (add-to-list 'default-frame-alist '(font . "Mononoki Nerd Font-11"))
;; (set-frame-parameter (selected-frame) 'alpha '(90 90))
;; (add-to-list 'default-frame-alist '(alpha 90 90))

(column-number-mode)
(display-time-mode)
(windmove-default-keybindings)
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


;;; DISPLAY \t IN GREY
(defface extra-whitespace-face
  '((t (:background "grey")))
  "Highlight rule used for tabs and special chars we want to see.")

(defvar my-extra-keywords
  '(("\t" . 'extra-whitespace-face))
  "Define keywords that are counted as extra and will be highlighted with `extra-whitespace-face'.")

;;; HOOKS
;; configure prog mode
(add-hook 'prog-mode-hook (lambda ()
                            (setq show-trailing-whitespace t)
                            (font-lock-add-keywords nil my-extra-keywords)))

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
