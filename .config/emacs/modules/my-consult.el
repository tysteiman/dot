(provide 'my-consult)

(use-package consult
  :bind (("C-x r j" . consult-register)
         ("C-M-s" . consult-ripgrep)))
