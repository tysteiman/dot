(setq debug-on-error t)

(setq package-archives '(("elpa" .
                          "http://tromey.com/elpa/")
                         ("melpa" .
                          "http://melpa.org/packages/")))

(package-initialize)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(fringe-mode 0)

(setq make-backup-files nil)
(setq vc-follow-symlinks t)

(setq-default indent-tabs-mode nil)
(setq-default truncate-lines t)

(setq debug-on-error nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (slim-mode magit))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
