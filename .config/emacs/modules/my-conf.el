(provide 'my-conf)

(tool-bar-mode 0)
(scroll-bar-mode 0)
(menu-bar-mode 0)
(show-paren-mode)
(column-number-mode t)
(display-time-mode)
(auto-revert-mode t)
(fset 'yes-or-no-p 'y-or-n-p)

(setq make-backup-files nil)
(setq ns-pop-up-frames nil)
(setq vc-follow-symlinks t)
(setq tags-revert-without-query t)
(setq ruby-insert-encoding-magic-comment nil)
(setq inhibit-startup-message t)
(setq dired-listing-switches "-lah")
(setq initial-scratch-message ";; scratch buffer\n\n")
(setq create-lockfiles nil)
(setq message-log-max 100)
(setq visible-bell nil)
(setq ring-bell-function 'ignore)

(setq shr-use-colors nil
      shr-inhibit-images t
      shr-use-fonts nil)

(setq compilation-scroll-output t)

(setq-default truncate-lines t)
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)
(setq-default js-indent-level 4)
(setq-default sgml-basic-offset 4)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'erase-buffer 'disabled nil)
