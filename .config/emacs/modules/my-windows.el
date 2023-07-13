(provide 'my-windows)

(use-package ace-window
  :bind (("M-o" . ace-window))
  :config (ace-window-posframe-mode 1))

(use-package posframe
  :after ace-window)

(use-package windmove
  :elpaca nil
  :config (windmove-mode 1)
  :bind (("M-l" . windmove-right)
         ("M-h" . windmove-left)
         ("M-k" . windmove-up)
         ("M-j" . windmove-down)))

