(let ((custom (concat user-emacs-directory "custom.el")))
  (setq custom-file custom)
  (when (file-exists-p custom)
    (load-file custom)))

(add-to-list 'load-path (concat user-emacs-directory "modules"))
(add-to-list 'load-path (concat user-emacs-directory "modules" "/packages"))

(require 'my-settings)
(require 'my-keys)
(require 'my-hooks)
(require 'my-auto-modes)
(require 'my-defuns)
(require 'my-packages)
