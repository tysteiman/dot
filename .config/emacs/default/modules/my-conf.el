(provide 'my-conf)

;; (scroll-bar-mode 0)
;; (tool-bar-mode 0)
;; (menu-bar-mode 0)
(show-paren-mode)
(column-number-mode t)
(display-time-mode)
(auto-revert-mode t)
(fset 'yes-or-no-p 'y-or-n-p)

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
      remote-file-name-inhibit-cache nil
      tramp-verbose 0
      vc-ignore-dir-regexp
      (format "\\(%s\\)\\|\\(%s\\)"
              vc-ignore-dir-regexp
              tramp-file-name-regexp))

(setq-default truncate-lines t
              indent-tabs-mode nil
              c-basic-offset 4
              js-indent-level 4
              sgml-basic-offset 4)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'erase-buffer 'disabled nil)

;; remove exit kbd
(global-unset-key (kbd "C-x C-c"))
