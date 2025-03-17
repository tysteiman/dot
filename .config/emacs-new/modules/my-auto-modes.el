(provide 'my-auto-modes)

(defun my--set-auto-mode (pattern mode)
  "Register a file pattern with a major mode"
  (add-to-list 'auto-mode-alist (cons pattern mode)))

(my--set-auto-mode "\\.[tj]sx\\'" 'js-jsx-mode)
(my--set-auto-mode "\\.mjs\\'" 'js-mode)
(my--set-auto-mode "\\.env.*\\'" 'conf-mode)
