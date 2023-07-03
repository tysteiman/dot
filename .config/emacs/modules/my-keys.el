(provide 'my-keys)

;; window splitting and closing, etc.
(global-set-key (kbd "C-M-0") 'delete-window)
(global-set-key (kbd "C-M-1") 'delete-other-windows)
(global-set-key (kbd "C-M-2") 'split-window-below)
(global-set-key (kbd "C-M-3") 'split-window-right)

;; navigate to init files
(global-set-key (kbd "C-c o m") 'my/open-module)
(global-set-key (kbd "C-c o i") 'my/open-init)
