(setq debug-on-error t)

(setq package-archives '(("elpa" .
                          "http://tromey.com/elpa/")
                         ("melpa" .
                          "http://melpa.org/packages/")))

(package-initialize)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(setq make-backup-files nil)
(setq vc-follow-symlinks t)

(setq-default indent-tabs-mode nil)
(setq-default truncate-lines t)

(setq debug-on-error nil)
