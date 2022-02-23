(setq custom-file (concat user-emacs-directory "custom.el"))

(tool-bar-mode 0)
(menu-bar-mode 0)
(column-number-mode t)
(scroll-bar-mode 0)
(show-paren-mode)
(display-time-mode)
(auto-revert-mode t)

(setq make-backup-files nil)
(setq ns-pop-up-frames nil)
(setq vc-follow-symlinks t)
(setq tags-revert-without-query t)
(setq ruby-insert-encoding-magic-comment nil)
;; (setq inhibit-startup-message t)
(setq dired-listing-switches "-lah")
(setq initial-scratch-message ";; scratch buffer\n\n")
;; (setq browse-url-firefox-program "chromium")
(setq create-lockfiles nil)

(setq-default truncate-lines t)
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)
(setq-default js-indent-level 4)
(setq-default sgml-basic-offset 4)

(column-number-mode t)

(defun my/load-config-file (file)
  "Load configuration .el file"
  (let ((full-path (concat user-emacs-directory file ".el")))
    (if (file-exists-p full-path)
        (load-file full-path)
      (message "File [%s] does not exist." full-path))))


(my/load-config-file "defuns")
(my/load-config-file "packages")

(when (display-graphic-p)
  (my/load-config-file "gui"))

(my/load-config-file "keys")

(add-hook 'prog-mode-hook 'my/configure-prog-mode)

(add-hook 'org-mode-hook (lambda ()
                           (toggle-truncate-lines)))

;; random puts
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'erase-buffer 'disabled nil)
