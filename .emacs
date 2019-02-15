;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq package-archives '(("melpa" . "https://stable.melpa.org/packages/")
			 ("gnu" . "https://elpa.gnu.org/packages/")))

(package-refresh-contents)

;; custom file
(setq custom-file "~/.emacs-custom.el")
(when (file-exists-p custom-file)
  (load-file custom-file))

;; auto install packages
(dolist (package '(
		   magit
		   company
		   ))
  (unless (package-installed-p package)
    (package-install package)))

;; funcalls
(tool-bar-mode 0)
(menu-bar-mode 0)
(column-number-mode t)
(scroll-bar-mode 0)
(show-paren-mode)
(display-time-mode)
(auto-revert-mode t)

;; custom package funcalls
(global-company-mode t)

;; setq
(setq make-backup-files nil)
(setq ns-pop-up-frames nil)
(setq vc-follow-symlinks t)
(setq tags-revert-without-query t)
(setq dired-listing-switches "-lah")
(setq initial-buffer-choice t)
(setq linum-format " %d ")
(setq-default truncate-lines t)
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)

;; load any local config we don't want in our repo
(let ((local "~/local.el"))
  (when (file-exists-p local)
    (load-file local)))
