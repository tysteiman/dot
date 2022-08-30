(setq custom-file (concat user-emacs-directory "custom.el"))

(setq gc-cons-threshold (* 60 1000 1000))

(defun my/load-file-emacs (file)
  (load-file (concat user-emacs-directory file ".el")))

;; Load bspwm configs if bspwm process is running.
(when (string= system-type "gnu/linux")
  (dolist (pc (list-system-processes))
    (let* ((psattr (process-attributes pc))
           (psname (cdr (assoc 'comm psattr))))
      (when (string= psname "bspwm")
        (my/load-file-emacs "bspwm")))))

;; Load emacs config files
(let ((files '(conf defun packages keys hook put)))
  (dolist (f files)
    (my/load-file-emacs (symbol-name f))))

;; TODO This is really only for lsp -- put there?
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb
