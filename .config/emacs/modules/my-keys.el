(provide 'my-keys)

;; UNSET
(global-unset-key (kbd "C-x C-c"))

;; SET
(global-set-key (kbd "C-c s r") 'my/send-region-to-shell)
(global-set-key (kbd "C-c s n") 'my/sync-notes)
(global-set-key (kbd "C-c s d") 'my/async-shell-command-docker)
(global-set-key (kbd "C-c i i") 'package-install)
(global-set-key (kbd "C-c i l") 'list-packages)
(global-set-key (kbd "C-c b v") (lambda ()
                                  (interactive)
                                  (revert-buffer nil t)
                                  (message "Buffer reverted.")))
