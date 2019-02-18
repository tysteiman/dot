;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq package-archives '(("melpa" . "https://stable.melpa.org/packages/")))

(package-refresh-contents)

;; custom file
(setq custom-file "~/.emacs-custom.el")
(when (file-exists-p custom-file)
  (load-file custom-file))

;; auto install packages
(dolist (package '(
                   magit
                   company
                   projectile
                   helm
                   helm-projectile
                   helm-swoop
                   window-numbering
                   ))
  (unless (package-installed-p package)
    (package-install package)))

;; funcalls
(tool-bar-mode 0)
(menu-bar-mode 0)
(column-number-mode t)
(scroll-bar-mode 0)
(show-paren-mode)
(display-time-mode)
(auto-revert-mode t)

;; custom package funcalls
(global-company-mode t)
(projectile-mode)
(helm-projectile-on)
(window-numbering-mode t)

;; setq
(setq make-backup-files nil)
(setq ns-pop-up-frames nil)
(setq vc-follow-symlinks t)
(setq tags-revert-without-query t)
(setq dired-listing-switches "-lah")
(setq initial-buffer-choice t)
(setq linum-format " %d ")
(setq-default truncate-lines t)
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)

;; set some keybindings
(dolist (key '(
               ("C-c m s" magit-status)
               ("C-c w c" whitespace-cleanup)
               ("C-x C-b" ibuffer)
               ;; helm bindings
               ("C-x C-f" helm-find-files)
               ("C-x b" helm-buffers-list)
               ("M-x" helm-M-x)
               ("C-c s s" helm-swoop)
               ))
  (let ((binding (car key))
        (command (car (cdr key))))
    (global-set-key (kbd binding) command)))

(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; add some prog mode hooks -- these will only be called when in "code" buffers.
(add-hook 'prog-mode-hook (lambda ()
                            ;; show line numbers
                            (linum-mode)
                            ;; show trailing whitespace
                            (setq-local show-trailing-whitespace t)))

;; load any local config we don't want in our repo
(let ((local "~/local.el"))
  (when (file-exists-p local)
    (load-file local)))
