(provide 'my-general)

(use-package general
  :config

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
   "w" 'ace-window
   "," 'execute-extended-command
   "/" 'swiper
   "?" 'swiper-thing-at-point
   "t" '(:ignore t :which-key "Tabs")
   )

  (general-define-key
   :prefix "g"
   :keymaps 'override
   :states 'normal
   "h" 'evil-beginning-of-line
   "l" 'evil-end-of-line
   "i" 'evil-first-non-blank
   )

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

