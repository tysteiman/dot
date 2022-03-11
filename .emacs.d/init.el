(defun my/compile-config ()
  "Compile init.org into init.elc"
  (interactive)
  (let ((source-file (concat user-emacs-directory "init.org"))
        (target-file (concat user-emacs-directory "init-tangle.el")))
    (require 'org)
    (org-babel-tangle-file source-file target-file)))

(defun my/setup-config-auto-compile-hook ()
  (let ((config (concat user-emacs-directory "init.org")))
    (when (string-equal
           (expand-file-name (buffer-file-name))
           (expand-file-name config))
      (add-hook 'after-save-hook 'my/compile-config nil t))))

(let ((init (concat user-emacs-directory "init-tangle.el")))
  (if (file-exists-p init)
      (load-file init)
    (progn
      (my/compile-config)
      (load-file init)))
  (add-hook 'org-mode-hook 'my/setup-config-auto-compile-hook))
