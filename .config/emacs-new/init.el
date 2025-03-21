;; LSP settings: https://emacs-lsp.github.io/lsp-mode/page/performance/
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024))

;; Configure 'custom' file
(let ((custom (concat user-emacs-directory "custom.el")))
  (setq custom-file custom)
  (when (file-exists-p custom)
    (load-file custom)))

;; Configure module paths
(add-to-list 'load-path (concat user-emacs-directory "modules"))
(add-to-list 'load-path (concat user-emacs-directory "modules" "/packages"))

;; Load config modules
(require 'my-settings)
(require 'my-keys)
(require 'my-hooks)
(require 'my-auto-modes)
(require 'my-defuns)
(require 'my-packages)

;; Load <emacs>/local.el if it exists for local/sensitive things.
(let ((localfile (concat user-emacs-directory "local.el")))
  (when (file-exists-p localfile)
    (load-file localfile)))
