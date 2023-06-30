(provide 'my-defuns)

(defun my/configure-prog-mode ()
  "Actions to take whenever prog-mode is entered or other non-prog inherited languages."
  (setq show-trailing-whitespace t)
  (display-line-numbers-mode 1))
