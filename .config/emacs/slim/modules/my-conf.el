(provide 'my-conf)

(set-face-attribute 'default nil :height 130 :family "agave Nerd Font")

(set-frame-parameter (selected-frame) 'alpha '(90 90))
(add-to-list 'default-frame-alist '(alpha 90 90))

(column-number-mode)
(display-time-mode)
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

;;; PUTS
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
