(provide 'my-general)

(use-package general
  :init
  (general-define-key
   :prefix "SPC"
   :keymaps 'override
   :states 'normal
   "f" 'projectile-find-file
   "b" 'switch-to-buffer
   "d" 'dired-jump))
