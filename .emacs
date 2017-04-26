;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(setq custom-file "~/.emacs.d/custom.el")

(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
                         ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

(menu-bar-mode 0)
(setq make-backup-files nil)
(setq ns-pop-up-frames nil)
(setq-default c-basic-offset 4)
(setq-default indent-tabs-mode nil)

(load-theme 'wombat)
