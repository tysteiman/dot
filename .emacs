;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p custom-file)
  (load-file custom-file))

(setq package-archives '(("elpa" .
                          "http://tromey.com/elpa/")
                         ("melpa" .
			  "http://melpa.org/packages/")))

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package '(php-mode
                   web-mode
                   projectile
                   emmet-mode
                   sudo-edit
                   window-numbering))
  (unless (package-installed-p package)
    (package-install package)))

(show-paren-mode)
(display-time-mode)
(column-number-mode)
(scroll-bar-mode 0)
(window-numbering-mode)

(setq make-backup-files nil)
(setq ns-pop-up-frames nil)
(setq vc-follow-symlinks t)
(setq tags-revert-without-query t)
(setq dired-listing-switches "-lah")

(setq-default truncate-lines t)
(setq-default indent-tabs-mode nil)

(let ((local "~/.local.el"))
  (when (file-exists-p local)
    (load-file local)))
