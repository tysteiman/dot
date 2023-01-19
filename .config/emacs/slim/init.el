(load-theme 'deeper-blue)

(set-face-attribute 'default nil :height 130)

;; set some variables
(setq make-backup-files nil
      create-lockfiles nil
      vc-follow-symlinks t
      dired-listing-switches "-lah"
      shr-use-colors nil   ;; eww
      shr-inhibit-images t ;; eww
      shr-use-fonts nil    ;; eww
      compilation-scroll-output t)

(setq-default truncate-lines t
	      indent-tabs-mode nil)

;; only stuff built into emacs!
(column-number-mode)
(display-time-mode)
(windmove-default-keybindings)
(winner-mode)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(menu-bar-mode 0)

;; ORG MODE
(setq org-startup-folded t)
(setq org-todo-keywords '((sequence "TODO" "IN PROGRESS" "QUESTION" "OPTIONAL" "|" "DONE" "ANSWERED")))
(setq org-todo-keyword-faces '(("QUESTION" . (:foreground "indianred"))
                               ("OPTIONAL" . (:foreground "tan"))
                               ("IN PROGRESS" . (:foreground "aqua"))))

;; if we want ivy/vertico type stuff, we can actually use fido-mode!

;; write some defuns
(defun open-config ()
  "Open Emacs init.el"
  (interactive)
  (find-file (concat user-emacs-directory "init.el")))
