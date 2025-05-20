(provide 'my-settings)

;; font
(set-face-attribute 'default nil :height 180 :family "Mononoki Nerd Font")

;; funcalls
(fringe-mode 10)
(column-number-mode)
(display-time-mode 1)
(winner-mode)
(which-key-mode)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(menu-bar-mode 0)
(fset 'yes-or-no-p 'y-or-n-p)

;; setqs
(setq make-backup-files nil
      create-lockfiles nil
      vc-follow-symlinks t
      find-file-visit-truename t
      dired-listing-switches "-lAh"
      shr-use-colors nil
      shr-inhibit-images t
      shr-use-fonts nil
      compilation-scroll-output t
      visible-bell nil
      ring-bell-function 'ignore
      ruby-insert-encoding-magic-comment nil
      org-startup-folded t
      set-mark-command-repeat-pop t
      mark-ring-max 8
      global-mark-ring-max 8
      native-comp-async-report-warnings-errors nil
      tags-revert-without-query 1
      tab-bar-new-button-show nil
      tab-bar-close-button-show nil
      dictionary-server "dict.org"
      initial-scratch-message ""
      inhibit-startup-screen t)

(setq-default truncate-lines t
              indent-tabs-mode nil
              c-basic-offset 2
              js-indent-level 2
              sgml-basic-offset 2)
