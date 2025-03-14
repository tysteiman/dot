(provide 'my-keys)

(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Windmove
(global-set-key (kbd "M-h") 'windmove-left)
(global-set-key (kbd "M-l") 'windmove-right)
(global-set-key (kbd "M-k") 'windmove-up)
(global-set-key (kbd "M-j") 'windmove-down)
(global-set-key (kbd "C-M-h") 'windmove-swap-states-left)
(global-set-key (kbd "C-M-l") 'windmove-swap-states-right)
(global-set-key (kbd "C-M-k") 'windmove-swap-states-up)
(global-set-key (kbd "C-M-j") 'windmove-swap-states-down)

