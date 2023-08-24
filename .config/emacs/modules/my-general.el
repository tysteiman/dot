(provide 'my-general)

(use-package general
  :config

  ;; Main SPC+ keybindings
  (general-define-key
   :prefix "SPC"
   :keymaps 'override
   :states 'normal
   "b" 'consult-buffer
   "d" 'dired-jump
   "D" 'dired
   "f" 'projectile-find-file
   "m" 'magit-status
   "o" 'delete-other-windows
   "p" 'projectile-switch-project
   "s" 'projectile-ripgrep
   "v" 'projectile-run-vterm
   "w" 'ace-window
   "," 'execute-extended-command
   "/" 'swiper
   "?" 'swiper-thing-at-point
   "l" '(:ignore t :which-key "LSP")
   "t" '(:ignore t :which-key "Tabs")
   )

  ;; SPC+ VTERM
  (general-define-key
   :prefix "SPC"
   :keymaps 'vterm-mode-map
   :states 'normal
   "r" 'rename-buffer)

  ;; g+ Movement Keys
  (general-define-key
   :prefix "g"
   :keymaps 'override
   :states 'normal
   "h" 'evil-beginning-of-line
   "l" 'evil-end-of-line
   "i" 'evil-first-non-blank
   )

  ;; SPC+l+ LSP Keys
  (general-define-key
   :prefix "SPC l"
   :keymaps 'override
   :states 'normal
   "l" 'eglot
   "s" 'eglot-shutdown
   "x" 'eglot-shutdown-all
   )

  ;; SPC+t+ Tab Keys
  (general-define-key
   :prefix "SPC t"
   :keymaps 'override
   :states 'normal
   "i" 'tab-switch
   "n" 'tab-next
   "p" 'tab-previous
   "q" 'tab-close
   "r" 'tab-rename
   "t" 'tab-new
   "!" 'tab-bar-mode
   )
  )

