(setq custom-file (concat user-emacs-directory "custom.el"))

(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024))

(add-to-list 'load-path (concat user-emacs-directory "modules"))
(require 'my-modules)
