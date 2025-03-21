(provide 'my-keys)

;; Remap Emacs commands
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "M-z") 'zap-up-to-char)

;; Windmove
(global-set-key (kbd "M-h") 'windmove-left)
(global-set-key (kbd "M-l") 'windmove-right)
(global-set-key (kbd "M-k") 'windmove-up)
(global-set-key (kbd "M-j") 'windmove-down)
(global-set-key (kbd "M-H") 'windmove-swap-states-left)
(global-set-key (kbd "M-L") 'windmove-swap-states-right)
(global-set-key (kbd "M-K") 'windmove-swap-states-up)
(global-set-key (kbd "M-J") 'windmove-swap-states-down)

;; Config Shortcuts
(global-set-key (kbd "C-c o i") 'my/open-init-file)
(global-set-key (kbd "C-c o m") 'my/open-module)
(global-set-key (kbd "C-c o p") 'my/open-package)
(global-set-key (kbd "C-c o l") 'my/open-local-file)

;; Shell
(global-set-key (kbd "C-c s s") 'my/send-region-to-shell-sync)
(global-set-key (kbd "C-c s a") 'my/send-region-to-shell-async)
