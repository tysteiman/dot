(setq custom-file (concat user-emacs-directory "custom.el"))

(setq gc-cons-threshold (* 60 1000 1000))

(defun my/load-file-emacs (file)
  "Load emacs file in user-emacs-directory matching `file'.el"
  (load-file (concat user-emacs-directory file ".el")))

;; Load emacs config files
(let ((files '(conf defun packages keys hook put)))
  (dolist (f files)
    (my/load-file-emacs (symbol-name f))))

(add-to-list 'load-path (concat user-emacs-directory "modules"))

(require 'my-evil)

;; TODO This is really only for lsp -- put there?
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb

