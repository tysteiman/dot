(provide 'my-auto-modes)

(add-to-list 'auto-mode-alist '("\\.[tj]sx\\'" . js-jsx-mode))

(add-to-list 'auto-mode-alist '("\\.env.*\\'" . conf-mode))
