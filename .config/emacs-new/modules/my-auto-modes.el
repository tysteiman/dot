(provide 'my-auto-modes)

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . js-jsx-mode))

(add-to-list 'auto-mode-alist '("\\.env.*\\'" . conf-mode))
