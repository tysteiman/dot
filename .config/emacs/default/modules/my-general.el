(provide 'my-general)

(use-package general
  :config

  ;; Global space
  (general-define-key
   :prefix "SPC"
   :keymaps 'override
   :states 'normal
   "f" 'projectile-find-file
   "F" 'projectile-find-file-other-window
   "b" 'switch-to-buffer
   "B" 'ibuffer
   "d" 'dired
   "D" 'dired-jump
   "o" 'delete-other-windows
   "/" 'swiper
   "g" 'magit-status
   "j" 'projectile-switch-project
   "s" 'projectile-ripgrep
   "S" 'counsel-rg
   "q" 'delete-window
   "V" 'my/revert-buffer
   "x" 'kill-this-buffer
   "," '(execute-extended-command :which-key "M-x")
   "c" '(:ignore t :which-key "Config")
   "k" '(:ignore t :which-key "Bookmarks")
   "n" '(:ignore t :which-key "Notes")
   "t" '(:ignore t :which-key "Toggle"))

  ;; SPC+c (Config)
  (general-define-key
   :prefix "SPC c"
   :keymaps 'override
   :states 'normal
   "c" 'my/open-init
   "m" 'my/open-module
   "b" 'my/open-bspwm-config)

  ;; SPC+k (Bookmarks)
  (general-define-key
   :prefix "SPC k"
   :keymaps 'override
   :states 'normal
   "j" 'bookmark-jump
   "s" 'bookmark-set
   "x" 'bookmark-delete
   "!" 'bookmark-delete-all)

  ;; SPC+t (Toggle)
  (general-define-key
   :prefix "SPC t"
   :keymaps 'override
   :states 'normal
   "b" 'centaur-tabs-mode
   "l" 'display-line-numbers-mode
   "m" 'hide-mode-line-mode
   "t" 'projectile-run-vterm
   "T" 'vterm
   "e" 'projectile-run-eshell
   "E" 'eshell
   "s" 'window-toggle-side-windows
   "P" 'my/pop-side-window
   "o" 'my/eshell-posframe
   "O" 'my/vterm-posframe)

  ;; BASH SCRIPTS
  (general-define-key
   :prefix "SPC"
   :keymaps '(shell-mode-map sh-mode-map)
   :states 'normal
   "!" 'my/send-line-to-shell)

  ;; LISP
  (general-define-key
   :prefix "SPC"
   :keymaps '(lisp-interaction-mode-map emacs-lisp-mode-map)
   :states 'normal
   "!" 'eval-buffer)

  ;; C
  (general-define-key
   :prefix "SPC"
   :keymaps '(c-mode-map)
   :states 'normal
   "!" 'compile)

  ;; SHELLS (eshell/vterm)
  (general-define-key
   :prefix "SPC"
   :keymaps '(eshell-mode-map vterm-mode-map)
   :states 'normal
   "r" 'rename-buffer)

  ;; LSP
  (general-define-key
   :keymaps '(lsp-mode-map override)
   :states 'normal
   "K" 'lsp-ui-doc-glance)

  ;; Notes (SPC + n)
  (general-define-key
   :prefix "SPC n"
   :keymaps 'override
   :states 'normal
   "s" 'my/sync-notes
   "d" 'my/dired-notes
   "f" 'my/find-note
   "w" 'my/find-work-note
   "h" 'my/find-home-note)

  ;; WINDMOVE (Meta + Vim)
  (general-define-key
   :keymaps 'override
   :states 'normal
   "M-h" 'windmove-left
   "M-j" 'windmove-down
   "M-k" 'windmove-up
   "M-l" 'windmove-right)

  ;; MISC (Unscoped)
  (general-define-key
   :keymaps 'override
   :states 'normal
   "C-c s r" 'my/send-region-to-shell
   "C-c s d" 'my/async-shell-command-docker
   "C-c s f" 'my/async-shell-command-on-file
   "C-c i i" 'package-install
   "C-c i l" 'list-packages))
