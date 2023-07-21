(provide 'my-tab-bar)

(tab-bar-mode 1)

(setq tab-bar-close-button-show nil)
(setq tab-bar-new-button-show nil)

(global-set-key (kbd "M-T") 'tab-new)
(global-set-key (kbd "M-Q") 'tab-close)
(global-set-key (kbd "M-N") 'tab-next)
(global-set-key (kbd "M-P") 'tab-previous)
(global-set-key (kbd "M-R") 'tab-rename)
(global-set-key (kbd "M-I") 'tab-switch)
