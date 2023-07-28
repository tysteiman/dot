(provide 'my-consult)

(use-package consult
  :bind (("C-x r j" . consult-register)
         ("C-M-s" . consult-ripgrep)
         ("C-x b" . consult-buffer)
         ("C-M-y" . consult-yank-from-kill-ring)))
