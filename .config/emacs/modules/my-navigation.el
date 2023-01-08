(provide 'my-navigation)

(use-package ibuffer
  :bind (("C-x C-b" . ibuffer))
  :config
  (define-key ibuffer-mode-map (kbd "C-x C-b") 'previous-buffer))

(use-package winner
  :defer 1
  :config (winner-mode))

;; (use-package window-numbering
;;   :defer 1
;;   :config (window-numbering-mode 1))

(use-package projectile
  :defer 1
  :config
  (projectile-mode 1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package swiper
  :bind (("C-M-s" . swiper))
  :hook (evil-after-load . (lambda ()
                             (my--evil-key-entry "/" 'swiper))))

(use-package rg
  :commands (projectile-ripgrep))

(use-package windmove
  :defer 1
  :config
  (windmove-default-keybindings)
  (windmove-mode 1))
