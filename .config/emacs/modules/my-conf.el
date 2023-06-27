(provide 'my-conf)

(set-face-attribute 'default nil :height 150 :family "Roboto Mono")

(column-number-mode)
(display-time-mode)
(winner-mode)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(menu-bar-mode 0)
(fset 'yes-or-no-p 'y-or-n-p)

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
(put 'erase-buffer 'disabled nil)

(defun my/open-init ()
  "Open Emacs init.el file"
  (interactive)
  (find-file (concat user-emacs-directory "init.el")))

(global-set-key (kbd "C-c o i") 'my/open-init)

(defun my/open-module (module)
  "Opens Emacs module file"
  (interactive
   (list
    (read-file-name "Emacs Module: " (concat user-emacs-directory "modules/"))))
  (find-file module))

(global-set-key (kbd "C-c o m") 'my/open-module)
