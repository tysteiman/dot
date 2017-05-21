;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(setq custom-file "~/.emacs.d/custom.el")                  ;; save custom changes away

(setq package-archives '(("elpa" .                         ;; add melpa
                          "http://tromey.com/elpa/")
                         ("melpa" .
                          "https://melpa.org/packages/")))

;; funcs
(package-initialize)                                       ;; init packages
(menu-bar-mode 0)                                          ;; no menu bar
(scroll-bar-mode 0)                                        ;; disable scroll bars
(tool-bar-mode 0)                                          ;; disable tool bar
(show-paren-mode)                                          ;; hl parens
(global-hl-line-mode)                                      ;; highlight current line

;; vars
(setq make-backup-files nil)                               ;; no backup files
(setq ns-pop-up-frames nil)                                ;; load files in same frame
(setq vc-follow-symlinks t)                                ;; don't prompt for symlinks
(setq tags-revert-without-query t)                         ;; don't prompt for tag refresh
(setq initial-buffer-choice t)                             ;; open scratch buffer on startup
(setq custom-safe-themes t)                                ;; allow custom themes

;; vars - defaults
(setq-default truncate-lines t)                            ;; truncate lines
(setq-default c-basic-offset 4)                            ;; C indentation to 4
(setq-default indent-tabs-mode nil)                        ;; only use spaces

;; puts
(put 'narrow-to-region 'disabled nil)                      ;; allow narrow

;; main let statement
;; ;; This is the main block of our .emacs file that will include most of our
;; ;; customization including key bindings and package auto installs.
;; ;; If this section gets to hard to maintain, break them out into defvars
;; ;; instead of inside the let statement itself.
(let (
      ;; key bindings
      ;; ;; Since I'm lazy I find it easier to bind simple Emacs procedures
      ;; ;; like movement commands etc directly into global-set-key by using
      ;; ;; lambdas. For more complex functions custom functions in general
      ;; ;; they shouldn't be defined here. However it should be fine if we
      ;; ;; have our own functions used inside of simple procedures in a lambda.
      ;; ;; Due to how Emacs binds keys, we actually don't have to have the
      ;; ;; packages installed before binding our keys. As long as the packages
      ;; ;; are indeed installed, we shouldn't have a problem.
      (keys '(("C-x C-b" (lambda ()                                 ;; switch to last buffer
                           "Visit the last visited (other) buffer"
                           (interactive)
                           (switch-to-buffer (other-buffer))))
              ("M-x"     helm-M-x)                                  ;; helm M-x
              ("C-x C-f" helm-find-files)                           ;; helm find files
              ("C-x b"   helm-buffers-list)))                       ;; helm buffers list

      ;; packages to auto install
      ;; ;; This should include any package we want to auto install
      ;; ;; This list can be as large as needed however it's a good
      ;; ;; idea to keep this down to the bare minimum.
      (packages '(magit
                  helm
                  projectile
                  helm-projectile
                  auto-complete
                  solarized-theme)))

  ;; SET KEYS
  (dolist (binding keys)
    (let ((key (car binding))
          (fun (car (cdr binding))))
      (when (and key fun)
        (global-set-key (kbd key) fun))))

  ;; INSTALL PACKAGES
  ;; ;; This will begin to auto install all packages set in the above
  ;; ;; packages list in our main let statement above. We don't care
  ;; ;; what packages were declared later on so we can include that
  ;; ;; in a simple let statement, install them, and forget about it.
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package packages)
    (unless (package-installed-p package)
      (package-install package))))

;; post install package specific settings
;; ;; Nothing should be put below unless it requires a specific
;; ;; package above to be downloaded / installed first. For example
;; ;; custom theme load-theme calls, helm, etc.
(setq ac-auto-show-menu 0)
(setq helm-mode-fuzzy-match t)
(setq helm-projectile-fuzzy-match t)
(setq solarized-high-contrast-mode-line t)

(load-theme 'solarized-dark)

(global-auto-complete-mode)
(projectile-mode)
(helm-projectile-on)
