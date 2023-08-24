(provide 'my-general)

(use-package general
  :config

  (general-define-key
   :prefix "SPC"
   :keymaps 'evil-normal-state-map
   "b" 'consult-buffer
   "d" 'dired-jump
   "f" 'projectile-find-file
   "m" 'magit-status
   "o" 'delete-other-windows
   "p" 'projectile-switch-project
   "s" 'projectile-ripgrep
   "," 'execute-extended-command
   "/" 'swiper
   "?" 'swiper-thing-at-point
   )

  (general-define-key
   :prefix "g"
   :keymaps 'evil-normal-state-map
   "h" 'evil-beginning-of-line
   "l" 'evil-end-of-line
   "i" 'evil-first-non-blank
   )
  )

