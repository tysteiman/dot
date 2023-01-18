(set-face-attribute 'default nil :height 130)

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

(defun open-config()
  "Open config file"
  (interactive)
  (find-file (concat user-emacs-directory "init.el")))
