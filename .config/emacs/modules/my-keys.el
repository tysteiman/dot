(provide 'my-keys)

(global-unset-key (kbd "C-x C-c"))

(global-set-key (kbd "C-c s r") 'my/send-region-to-shell)
(global-set-key (kbd "C-c s l") 'my/send-line-to-shell)
(global-set-key (kbd "C-c s n") 'my/sync-notes)
(global-set-key (kbd "C-c s u") 'my/update-arch)
(global-set-key (kbd "C-c s d") 'my/async-shell-command-docker)
(global-set-key (kbd "C-c f c") 'my/open-init)
(global-set-key (kbd "C-c f m") 'my/open-module)

;; other package commands
(global-set-key (kbd "C-c f i") 'imenu)
(global-set-key (kbd "C-c e s") 'eshell)
(global-set-key (kbd "M-z")     'zap-up-to-char)
(global-set-key (kbd "C-c i i") 'package-install)
(global-set-key (kbd "C-c i l") 'list-packages)
(global-set-key (kbd "C-c t l") 'display-line-numbers-mode)
(global-set-key (kbd "C-c t m") 'hide-mode-line-mode)
(global-set-key (kbd "C-c b r") 'rename-buffer)
(global-set-key (kbd "C-c b v") (lambda ()
                                  (interactive)
                                  (revert-buffer nil t)
                                  (message "Buffer reverted.")))