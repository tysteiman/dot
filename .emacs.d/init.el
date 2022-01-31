(setq custom-file (concat user-emacs-directory "custom.el"))

(set-face-attribute 'default nil :height 110)

(set-frame-parameter (selected-frame) 'alpha '(80 . 60))
(add-to-list 'default-frame-alist '(alpha . (80 . 60)))

(tool-bar-mode 0)
(menu-bar-mode 0)
(column-number-mode t)
(scroll-bar-mode 0)
(show-paren-mode)
(display-time-mode)
(auto-revert-mode t)
(fringe-mode 10)

(setq make-backup-files nil)
(setq ns-pop-up-frames nil)
(setq vc-follow-symlinks t)
(setq tags-revert-without-query t)
(setq ruby-insert-encoding-magic-comment nil)
(setq inhibit-startup-message t)
(setq dired-listing-switches "-lah")
(setq initial-scratch-message ";; scratch buffer\n\n")
(setq browse-url-firefox-program "chromium")
(setq create-lockfiles nil)

(setq-default truncate-lines t)
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)
(setq-default js-indent-level 4)
(setq-default sgml-basic-offset 4)

(column-number-mode t)

(add-hook 'prog-mode-hook (lambda ()
                            (setq show-trailing-whitespace t)
                            (when (display-graphic-p)
                              (hl-line-mode 1))
                            ))

(add-hook 'org-mode-hook (lambda ()
                           (toggle-truncate-lines)))

(defun my/load-config-file (file)
  "Load configuration .el file"
  (let ((full-path (concat user-emacs-directory file ".el")))
    (if (file-exists-p full-path)
        (load-file full-path)
      (message "File [%s] does not exist." full-path))))

;; LOAD PACKAGES
(my/load-config-file "defuns")
(my/load-config-file "packages")

;; stuff to do only when gui is available i.e. graphical-related packages
(when (display-graphic-p)
  (my/load-config-file "gui-packages"))

(my/load-config-file "keys")

;; random puts
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'erase-buffer 'disabled nil)
