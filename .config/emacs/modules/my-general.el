(provide 'my-general)

(use-package general
  :init
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
   "D" 'projectile-find-dir
   "o" 'delete-other-windows
   "/" 'swiper
   "g" 'magit-status
   "j" 'projectile-switch-project
   "s" 'projectile-ripgrep
   "q" 'delete-window
   "," '(execute-extended-command :which-key "M-x")
   "k" '(:ignore t :which-key "Bookmarks")
   "t" '(:ignore t :which-key "Toggle"))
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
   "l" 'display-line-numbers-mode
   "m" 'hide-mode-line-mode
   "t" 'projectile-run-vterm
   "e" 'projectile-run-eshell
   "s" 'window-toggle-side-windows
   "P" 'my/pop-side-window)
  ;; BASH SCRIPTS
  (general-define-key
   :prefix "SPC"
   :keymaps '(shell-mode-map sh-mode-map)
   :states 'normal
   "!" 'my/send-line-to-shell)
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
   "K" 'lsp-ui-doc-glance))
