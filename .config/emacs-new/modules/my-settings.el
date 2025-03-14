(provide 'my-settings)

(set-face-attribute 'default nil :height 140)

(column-number-mode)
(display-time-mode)
(winner-mode)
(which-key-mode)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(menu-bar-mode 0)
(fset 'yes-or-no-p 'y-or-n-p)

(setq make-backup-files nil
      create-lockfiles nil
      vc-follow-symlinks t
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
      tags-revert-without-query 1)

(setq-default truncate-lines t
              indent-tabs-mode nil
              c-basic-offset 2
              js-indent-level 2
              sgml-basic-offset 2)

