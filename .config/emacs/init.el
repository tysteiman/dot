;; Startup
(setq custom-file (concat user-emacs-directory "custom.el"))
(set-face-attribute 'default nil :height 160 :family "0xProto Nerd Font Mono")

;; Configure Emacs
(column-number-mode)
(display-time-mode)
(winner-mode)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(menu-bar-mode 0)
(fset 'yes-or-no-p 'y-or-n-p)

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
      tags-revert-without-query 1)

(setq-default truncate-lines t
              indent-tabs-mode nil
              c-basic-offset 2
              js-indent-level 2
              sgml-basic-offset 2)

(global-set-key (kbd "M-h") 'windmove-left)
(global-set-key (kbd "M-l") 'windmove-right)
(global-set-key (kbd "M-k") 'windmove-up)
(global-set-key (kbd "M-j") 'windmove-down)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Hooks
(add-hook 'compilation-filter-hook (lambda ()
                                     (ansi-color-apply-on-region (point-min) (point-max))))

(add-hook 'prog-mode-hook (lambda ()
                            (setq show-trailing-whitespace t)))

(add-hook 'org-mode-hook (lambda ()
                           (setq truncate-lines nil)))

(add-hook 'markdown-mode-hook (lambda ()
                            (setq truncate-lines nil)))

;; Git Blame
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

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(require 'use-package-ensure)
(setq use-package-always-ensure t)
(setq use-package-verbose t)

(use-package typescript-mode
  :init (setq-default typescript-indent-level 2)
  :mode ("\\.ts\\'" "\\.js\\'"))

(use-package conf-mode
  :mode ("\\.env\\'"))

(use-package vterm :defer t)

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

(use-package magit :defer t)

(use-package diff-hl
  :defer t
  :hook
  (prog-mode . diff-hl-mode)
  (yaml-mode . diff-hl-mode)
  (magit-pre-refresh . diff-hl-magit-pre-refresh)
  (magit-post-refresh . diff-hl-magit-post-refresh))

(use-package yaml-mode :defer t)

(use-package swiper
  :bind (("C-M-/" . swiper-thing-at-point)))

(use-package ef-themes
  :config (load-theme 'ef-autumn t))

(use-package diredfl
  :config (diredfl-global-mode 1))

;; TODO this will install LSP and all types of shit, maybe check out dape...
;; (use-package dap-mode
;;   :defer t
;;   :config
;;   (require 'dap-node)
;;   (dap-node-setup)
;;   :hook
;;   (dap-mode . dap-ui-mode))
