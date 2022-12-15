(setq custom-file (concat user-emacs-directory "custom.el"))

(setq gc-cons-threshold (* 60 1000 1000))

(add-to-list 'load-path (concat user-emacs-directory "modules"))

(require 'my-conf)
(require 'my-defuns)
(require 'my-keys)
(require 'my-hooks)
(require 'my-packages)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'erase-buffer 'disabled nil)

(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb
