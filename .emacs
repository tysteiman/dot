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
(show-paren-mode)                                          ;; hl parens
(load-theme 'wombat)                                       ;; wombat theme!

;; vars
(setq make-backup-files nil)                               ;; no backup files
(setq ns-pop-up-frames nil)                                ;; load files in same frame
(setq vc-follow-symlinks t)                                ;; don't prompt for symlinks

;; vars - defaults
(setq-default truncate-lines t)                            ;; truncate lines
(setq-default c-basic-offset 4)                            ;; C indentation to 4
(setq-default indent-tabs-mode nil)                        ;; only use spaces

;; puts
(put 'narrow-to-region 'disabled nil)                      ;; allow narrow
