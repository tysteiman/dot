(provide 'my-general)

(use-package general
  :config

  (general-create-definer my-space-leader
    :prefix "SPC")

  (my-space-leader
    :keymaps 'normal
    "," '(execute-extended-command :which-key "M-x")
    "a" 'gptel
    "b" 'switch-to-buffer
    "d" 'dired-jump
    "f" 'project-find-file
    "g" 'project-find-regexp
    "m" 'magit-status
    "p" 'project-switch-project
    "r" 'rename-buffer
    "t" 'vterm))
