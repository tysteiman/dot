(provide 'my-keys)

;; Vanilla Emacs Commands
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "M-z")     'zap-up-to-char)
(global-set-key (kbd "C-c e")   'eshell)
(global-set-key (kbd "C-c u t") 'load-theme)
(global-set-key (kbd "C-c u n") 'display-line-numbers-mode)
(global-set-key (kbd "<f1>") 'display-line-numbers-mode)
(global-set-key (kbd "C-c o y") 'dictionary-search)

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

;; Org
(with-eval-after-load 'org
  (define-key org-mode-map (kbd "C-c n s") 'my/insert-org-src-block))

(which-key-add-key-based-replacements "C-c a" "GPT")
(which-key-add-key-based-replacements "C-c n" "Notes")
(which-key-add-key-based-replacements "C-c o" "Open...")
(which-key-add-key-based-replacements "C-c s" "Shell")
(which-key-add-key-based-replacements "C-c u" "UI")
