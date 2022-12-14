(use-package dockerfile-mode
  :defer t)

(use-package yaml-mode
  :hook (yaml-mode . my/configure-prog-mode))

(use-package conf-mode
  :hook (conf-mode . my/configure-prog-mode)
  :mode "\\.env\\'")

(use-package js2-mode
  :defer t
  :mode "\\.js\\'")

(use-package rjsx-mode
  :defer t
  :init
  (setq js2-mode-show-parse-errors nil)
  (setq js2-mode-show-strict-warnings nil)
  :mode "\\.jsx\\'"
  :config
  (define-key rjsx-mode-map (kbd "C-j") 'emmet-expand-line)
  (define-key rjsx-mode-map (kbd "M-.") 'xref-find-definitions)
  (define-key js2-mode-map (kbd "M-.") 'xref-find-definitions))

(use-package php-mode
  :defer t)

(use-package web-mode
  :mode "\\.erb\\'"
  :mode "\\.php\\'"
  :mode "\\.html\\'"
  :mode "\\.ctp\\'"
  :config
  (define-key web-mode-map (kbd "C-j") 'emmet-expand-line))

(use-package markdown-mode
  :defer t
  :hook (markdown-mode . my/configure-prog-mode))

(use-package slim-mode
  :defer t)

(use-package csv-mode
  :defer t
  :hook (csv-mode . csv-align-mode))

(use-package json-mode
  :defer t)

(use-package fish-mode
  :defer t)

(use-package prettier
  :after (:any js2-mode rjsx-mode)
  :hook
  (js2-mode  . my/configure-prettier)
  (rjsx-mode . my/configure-prettier))

(use-package tree-sitter
  :hook
  (ruby-mode . tree-sitter-hl-mode)
  (java-mode . tree-sitter-hl-mode)
  (css-mode  . tree-sitter-hl-mode)
  (rust-mode . tree-sitter-hl-mode)
  (c-mode    . tree-sitter-hl-mode)
  (sh-mode   . tree-sitter-hl-mode)
  (yaml-mode . tree-sitter-hl-mode)
  (php-mode  . tree-sitter-hl-mode))

(use-package tree-sitter-langs :defer t)

;; (use-package dashboard
;;   :init
;;   ;; (setq dashboard-startup-banner 'logo)
;;   (setq dashboard-startup-banner (if (display-graphic-p) 'logo (concat user-emacs-directory "banner.txt")))
;;   (setq dashboard-set-heading-icons t)
;; 
;;   (setq initial-buffer-choice (lambda ()
;;                                 (get-buffer "*dashboard*")))
;; 
;;   (setq dashboard-items '((recents . 20)
;;                           (projects . 20)))
;; 
;;   :config
;;   (dashboard-setup-startup-hook)
;;   (dashboard-modify-heading-icons '((projects . "repo")
;;                                     (recents  . "squirrel")))
;;   (global-set-key (kbd "C-c f d") (lambda ()
;;                                     (interactive)
;;                                     (switch-to-buffer "*dashboard*"))))

(use-package flyspell
  :hook (org-mode . my/flyspell))

(use-package pulseaudio-control
  :config (pulseaudio-control-default-keybindings))

(use-package sudo-edit
  :defer t)

(use-package dictionary
  :defer t)

(use-package docker
  :defer t)

(use-package rust-mode
  :defer t)
